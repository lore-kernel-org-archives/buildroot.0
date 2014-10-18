From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 12:38:12 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/8] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <20141018102545.GB3858@free.fr>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <20141017222009.GQ3971@free.fr>
 <CAGduivxFryWGKcB+UWco-h3dab+2VSv+6beYG86iVapG6PGfCQ@mail.gmail.com>
 <20141018102545.GB3858@free.fr>
Message-ID: <CAGduivy41-Q4oLTK0Of76Fekm5k4Oap8WHy2G_bG3ztvD-Uhdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 18, 2014 at 12:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On 2014-10-18 12:15 +0200, Maxime Hadjinlian spake thusly:
>> On Sat, Oct 18, 2014 at 12:20 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Thomas, All,
>> >
>> > On 2014-10-16 21:15 +0200, Thomas De Schampheleire spake thusly:
>> >> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> >>
>> >> check-requirements simply has to know if the results have to be sent, so
>> >> it can check on some extra requirements. The username and password are
>> >> irrelevant here.
>> >> This commit introduces a boolean variable do_send_results to hide these
>> >> details.
>> >>
>> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> >> ---
>> >>  scripts/autobuild-run | 9 +++++----
>> >>  1 file changed, 5 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> >> index 7497001..2ead1f2 100755
>> >> --- a/scripts/autobuild-run
>> >> +++ b/scripts/autobuild-run
>> >> @@ -85,12 +85,12 @@ def check_version():
>> >>          print "ERROR: script version too old, please upgrade."
>> >>          sys.exit(1)
>> >>
>> >> -def check_requirements(http_login, http_password):
>> >> +def check_requirements(do_send_results=False):
>> >>      devnull = open(os.devnull, "w")
>> >>      needed_progs = ["make", "git", "gcc", "timeout"]
>> >>      missing_requirements = False
>> >>
>> >> -    if http_login and http_password:
>> >> +    if do_send_results:
>> >>          needed_progs.append("curl")
>> >>
>> >>      for prog in needed_progs:
>> >> @@ -553,8 +553,9 @@ if __name__ == '__main__':
>> >>      check_version()
>> >>      sysinfo = SystemInfo()
>> >>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
>> >> -    check_requirements(http_login, http_password)
>> >> -    if http_login is None or http_password is None:
>> >> +    do_send_results = http_login and http_password
>> >
>> > I was told that we should no treat 'None' as 'False', or a non-empty
>> > string as 'True'. This should be something like:'
>> You can treat 'None' as 'False' and also a non empty string will value
>> a logical 'True'.
>> In a python interpreter, do bool(None) and bool('blabla'), you'll
>> respectively get 'False' and 'True'.
>>
>> I hope I am not the one you told you that in the first place...
>
> Not sure it was Samuel or you, but I just looked at PEP8:
>
>     http://legacy.python.org/dev/peps/pep-0008/#programming-recommendations
>
>     Comparisons to singletons like None should always be done with is or
>     is not, never the equality operators.
>
>     Also, beware of writing if x when you really mean if x is not None --
>     e.g. when testing whether a variable or argument that defaults to None
>     was set to some other value. The other value might have a type (such as
>     a container) that could be false in a boolean context!
>
Here it's fine since we only deal with basic type.
> Regards,
> Yann E. MORIN.
>
>> >     do_send_results = (not http_login is None) and (not http_password is None)
>> >
>> > Regards,
>> > Yann E. MORIN.
>> >
>> >> +    check_requirements(do_send_results)
>> >> +    if not do_send_results:
>> >>          print "WARN: due to the lack of http login/password details, results will not be submitted"
>> >>          print "WARN: tarballs of results will be kept locally only"
>> >>      def sigterm_handler(signum, frame):
>> >> --
>> >> 1.8.5.1
