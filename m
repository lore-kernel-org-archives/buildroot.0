From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 20:15:28 +0200
Subject: [Buildroot] [autobuild 1/4] autobuild-run: prevent send_result
 from failing when gathering config files
In-Reply-To: <20150412192051.5d747e28@free-electrons.com>
References: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
 <20150412192051.5d747e28@free-electrons.com>
Message-ID: <CAHXCMM+Mz485o6zV0OktecHL9o7LaxCGD+-3p4yFcVpwiTpFJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 12, 2015 at 7:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 12 Apr 2015 16:34:42 +0200, Samuel Martin wrote:
>> - Make sure using absolute paths in os.path.relpath();
>> - os.makedirs() can fail if the directory already exists, so only create it
>>   when needed.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  scripts/autobuild-run | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index 0e12080..a19d51b 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -653,15 +653,16 @@ def send_results(result, **kwargs):
>>          if not reason:
>>              return
>>
>> -        srcroot = os.path.join(outputdir, "build", '-'.join(reason))
>> -        destroot = os.path.join(resultdir, '-'.join(reason))
>> +        srcroot = os.path.abspath(os.path.join(outputdir, "build", '-'.join(reason)))
>> +        destroot = os.path.abspath(os.path.join(resultdir, '-'.join(reason)))
>
> Can you explain why this is needed?

During my tests, I ran into some weird errors because it was trying to
mkdir some directories in the package builddir itself instead of in
the result location.
I certainly messed up something, I'll check again.
And... indeed after a close look at code, it should not be necessary...

Reagrds,

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
