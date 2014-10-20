From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 11:47:17 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 01/11] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <20141019225918.57f55ebf@free-electrons.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-2-git-send-email-patrickdepinguin@gmail.com>
 <20141019225918.57f55ebf@free-electrons.com>
Message-ID: <CAAXf6LX4SQsCCnbU5aR37KypC+QUx3ryVPk4hoiceQebu9ic4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 19, 2014 at 10:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sun, 19 Oct 2014 21:29:57 +0200, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> check-requirements simply has to know if the results have to be sent, so
>> it can check on some extra requirements. The username and password are
>> irrelevant here.
>> This commit introduces a boolean variable do_send_results to hide these
>> details.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> ---
>> v2: implement comments on boolean logic (Yann, Maxime, Arnout)
>
> I'm fine with the idea, but...
>
>>  scripts/autobuild-run | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index 7497001..282f15d 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -85,12 +85,12 @@ def check_version():
>>          print "ERROR: script version too old, please upgrade."
>>          sys.exit(1)
>>
>> -def check_requirements(http_login, http_password):
>> +def check_requirements(do_send_results=False):
>>      devnull = open(os.devnull, "w")
>>      needed_progs = ["make", "git", "gcc", "timeout"]
>>      missing_requirements = False
>>
>> -    if http_login and http_password:
>> +    if do_send_results:
>>          needed_progs.append("curl")
>>
>>      for prog in needed_progs:
>> @@ -553,10 +553,15 @@ if __name__ == '__main__':
>>      check_version()
>>      sysinfo = SystemInfo()
>>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
>> -    check_requirements(http_login, http_password)
>> -    if http_login is None or http_password is None:
>> +
>> +    # http_login/password could theoretically be allowed as empty, so check
>> +    # explicitly on None.
>> +    do_send_results = (http_login is not None) and (http_password is not None)
>> +    check_requirements(do_send_results)
>> +    if not do_send_results:
>>          print "WARN: due to the lack of http login/password details, results will not be submitted"
>>          print "WARN: tarballs of results will be kept locally only"
>> +
>>      def sigterm_handler(signum, frame):
>>          os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
>>          sys.exit(1)
>
> are you not overlooking another place where http_login + http_password
> are used to find out whether uploading should take place? I.e, in:
>
>     if http_login and http_password:
>         # Submit results. Yes, Python has some HTTP libraries, but
>         # none of the ones that are part of the standard library can
>         # upload a file without writing dozens of lines of code.
>
> Probably we want the same test to be used everywhere?

Hmm, indeed.
But then I think we better add do_send_results to kwargs so the value
can be calculated once and used multiple times. Btw, if you have a
better name than do_send_results, that would be great. I'd pick
'send_results' but it's already the function name...

Best regards,
Thomas
