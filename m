From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Tue, 14 Apr 2015 21:58:18 +0200
Subject: [Buildroot] [PATCH v2 10/10] autobuild-run: set locale to en_US
 or C
In-Reply-To: <CAHXCMMKGjOfOSQfiP5bnNe9KeHEaTkDAcjXv7RA0U4t=iEXqHA@mail.gmail.com>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
 <1426693843-28792-11-git-send-email-dywi@mailerd.de>
 <CAHXCMMKGjOfOSQfiP5bnNe9KeHEaTkDAcjXv7RA0U4t=iEXqHA@mail.gmail.com>
Message-ID: <CAGrucu37+u58boPOTyb2rW=fg6=69KHuuK_q8iFurSvJyp-6Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2015-04-12 10:31 GMT+02:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Andr?, Thomas, all,
>
> On Wed, Mar 18, 2015 at 4:50 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
>> some python scripts break if the locale is set to C, try en_US{.UTF-8,} first
> Could you give an example of such a script?
>

Apart from the small snippet I've included below the commit message:
no, I don't have any real-world script at hand that exposes this issue
and is sufficiently small. In general, it occurs when a script relies
on the default system encoding derived from the LANG/LC_ and has to
deal with non-ascii strings, e.g. when using open() and not
io.open()/codecs.open() to read a file.

>>
>> Additionally, drop all locale env vars (LC_*, LANG[GUAGE]) when
>> setting the new locale.
>>
>> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
>> ---
>>
>> Just for reference, a small python example that breaks if LANG is set to C:
>>
>>   $ LANG=C python -c "print(u'Andr\xe9')"
>>   UnicodeEncodeError: 'ascii' codec can't encode character u'\xe9' in position 4: ordinal not in range(128)
>>
>> ---
>>  scripts/autobuild-run | 48 ++++++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 44 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index e1a3398..a1e947d 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -168,6 +168,12 @@ class SystemInfo:
>>      DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
>>      DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
>>
>> +    # list of default locales (in lowercase, without "-", descending order)
>> +    #  some python scripts break if the locale is set to C, try en_US first
>> +    TRY_LOCALES = ['en_us.utf8', 'en_us', 'c']
>> +    # list of locale environment variables that should be (re-)set by set_locale()
>> +    LOCALE_KEYS = ['LANG']
>> +
>>      def __init__(self):
>>          self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
>>          self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
>> @@ -231,6 +237,41 @@ class SystemInfo:
>>
>>          return not missing_requirements
>>
>> +    def set_locale(self):
>> +        def is_locale_env_varname(w):
>> +            # w[:4] == 'LANG' and (not w[4:] or w[4:] == 'UAGE') ...
> Hmm... I must say the comment is rather confusing!
>

I'll drop it.

I usually take some "this could be optimized" notes while coding, this
one aims at reducing the str parts that need to be matched more than
once, because the word w matches "LANG" or "LANGUAGE" if the first 4
chars match "LANG" and the remainder is either empty or "UAGE".

>> +            return w[:3] == 'LC_' or w == 'LANG' or w == 'LANGUAGE'
> or: return w.startswith('LC_') or w in ['LANG', 'LANGUAGE']
>
>> +
>> +        ret, locales_str = self.run_cmd_get_stdout(["locale", "-a"])[
>> +        if ret != os.EX_OK:
>> +            return False
>> +
>> +        # create a dict
>> +        #   <locale identifier> (as listed in TRY_LOCALES) => <locale env name>
>> +        locales = dict((
>> +            (k.lower().replace("-", ""), k) for k in locales_str.split(None)
> s/None//
>
>> +        ))
>> +
>> +        for loc_key in filter(lambda x: x in locales, self.TRY_LOCALES):
> Is a for loop really needed here?
> You could just do:
>   try:[
>     loc_key = filter(lambda x: x in locales, self.TRY_LOCALES)[0]
>   except (TypeError, IndexError):
>     # set "C" as locale
>     loc_key = self.TRY_LOCALES[-1]
>

I've chosen a for-loop here because it works with both python 2 and
python 3 equally well:

* in python 2: filter() returns a list  =>  "filter(...)[0]" enclosed
by a "try/except IndexError" block
* in python 3: filter() returns a generator object  =>
"next(filter(...))" enclosed by a "try/except StopIteration" block

None of these variants are compatible with each other, because you
can't access generator items by index (filter(...)[0] raises a
TypeError in py3), and lists are not iterators (next(filter(...))
raises a TypeError in py2).

What would work for both py2/py3 is "next(iter(filter(...)))" enclosed
by a "try/except StopIteration" block, but the for-loop is more
readable.


>> +            # cannot modify self.env while iterating over it,
>> +            #  create intermediate list
>> +            env_old_locale_keys = [
>> +                k for k in self.env.keys() if is_locale_env_varname(k)
>> +            ]
>> +            for k in env_old_locale_keys:
>> +                del self.env[k]
> Setting the new value will automatically override the old value, so
> deleting it before looks a bit overkill...
>

Deleting/Inserting is asymmetrical:

* drop any env var matching LANG, LANGUAGE or LC_* (LC_MESSAGES et al)
* set LANG to the new locale

We could also simply set LC_ALL instead of deleting LC_*, but that
opens up the possibility to leak LC_ env vars when LC_ALL gets
unset/emptied:

$ env LC_MESSAGES=en_US.UTF-8 LC_ALL=de_DE.UTF-8  sh -c 'locale | grep
LC_MES; export LC_ALL=; locale | grep LC_MES;'

LC_MESSAGES="de_DE.UTF-8"
LC_MESSAGES=en_US.UTF-8

>> +
>> +            # set new locale once
>> +            for vname in self.LOCALE_KEYS:
>> +                self.env[vname] = locales[loc_key]
>> +            return True
>> +        # -- end for
>> +        # practically impossible to reach this return if 'c' is in TRY_LOCALES:
>> +        return None
>> +
>> +    def sanitize_env(self):
>> +        self.set_locale()
>> +
>>      def popen(self, cmdv, **kwargs):
>>          kwargs.setdefault('stdin', self.devnull)
>>          kwargs.setdefault('stdout', self.devnull)
>> @@ -789,12 +830,11 @@ def merge(dict_1, dict_2):
>>
>>  def main():
>>
>> -    # Avoid locale settings of autobuilder machine leaking in, for example
>> -    # showing error messages in another language.
>> -    os.environ['LC_ALL'] = 'C'
>> -
>>      check_version()
>>      sysinfo = SystemInfo()
>> +    # Avoid locale settings of autobuilder machine leaking in, for example
>> +    # showing error messages in another language.
>> +    sysinfo.sanitize_env()
>>
>>      args = docopt.docopt(doc, version=VERSION)
>>
>> --
>> 2.3.2
>>


-- 
Andr?
