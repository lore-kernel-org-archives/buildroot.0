From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 13 Aug 2018 07:42:37 +0200
Subject: [Buildroot] [PATCH 1/1] Enhanced resiliency of PyPI scanning
 tool
In-Reply-To: <CAGm1_kvZMy5k4tjP7O5PkTdoGxPQ_dZgWcHgwNwys9cFVjQ+qw@mail.gmail.com>
References: <20180807121514.8989-1-malachi.burke@gmail.com>
 <CAGm1_kvZMy5k4tjP7O5PkTdoGxPQ_dZgWcHgwNwys9cFVjQ+qw@mail.gmail.com>
Message-ID: <CAGm1_ktYAvdUur8NiWF0YFZwDETVGg=WKhR=UL_wFdaN_r5r+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 10, 2018 at 7:00 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Malachi,
>
> On Tue, Aug 7, 2018 at 2:15 PM, Malachi Burke <malachi.burke@gmail.com> wrote:
>> Specifically during scenarios where (probably older)
>> python packages don't explicitly specify their name
>> during setup.py processing, we can fallback and use
>> metadata_name to track setup_args
>
> Please provide URL for such a package.
>
>> Signed-off-by: Malachi Burke <malachi.burke@gmail.com>
>> ---
>>  utils/scanpypi | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/utils/scanpypi b/utils/scanpypi
>> index 12c96b842e..8e8643a8db 100755
>> --- a/utils/scanpypi
>> +++ b/utils/scanpypi
>> @@ -45,6 +45,13 @@ except ImportError:
>>      liclookup = None
>>
>>
>> +# Ugly global representing currently evaluating package
>> +# need this because some packages don't specify their name
>> +# fortunately BuildrootPackage operates iteratively and not
>> +# recursively, so managing this is straightforward
>> +current_package = None
>> +
>> +
>>  def setup_decorator(func, method):
>>      """
>>      Decorator for distutils.core.setup and setuptools.setup.
>> @@ -60,8 +67,11 @@ def setup_decorator(func, method):
>>      def closure(*args, **kwargs):
>>          # Any python packages calls its setup function to be installed.
>>          # Argument 'name' of this setup function is the package's name
>> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
>> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
>> +        # When 'name' isn't available, we query current_package
>> +        name = kwargs.get('name', current_package.metadata_name)
>> +
>> +        BuildrootPackage.setup_args[name] = kwargs
>> +        BuildrootPackage.setup_args[name]['method'] = method
>>      return closure
>>
>>  # monkey patch
>> @@ -278,6 +288,8 @@ class BuildrootPackage():
>>          current_dir = os.getcwd()
>>          os.chdir(self.tmp_extract)
>>          sys.path.append(self.tmp_extract)
>> +        global current_package
>
> Can we avoid using 'global' construct?

What do you think about this patch/issue?

Malachi pointed me to the mock package [1]. Its setup.py is missing
'name' keyword. I've sent a PR [2] fixing this, but the project
doesn't seem to actively maintained.

We already had a similar discussion [3]. The decision was to avoid
fixing such things by scanpypi and just to inform the user, that the
package is malformed. I could add related error messages to the except
clauses.

[1] https://github.com/testing-cabal/mock
[2] https://github.com/testing-cabal/mock/pull/433
[3] http://lists.busybox.net/pipermail/buildroot/2018-January/212333.html

Regards,
Yegor
