From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 28 Jan 2019 00:20:33 -0200
Subject: [Buildroot] Buildroot 2018.11.1 released
References: <20181220091656.40397ad9@windsurf>
Message-ID: <5c4e66f13d185_30e3fbb3e15ae1c48ee@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry the long delay.

On Thu, Dec 20, 2018 at 06:16 AM, Thomas Petazzoni wrote:

[snip]
> +Fabio for Freescale/NXP related build failures, +Ricardo for the
> systemd test failure.
> 
> On Wed, 19 Dec 2018 23:25:27 +0100, Peter Korsgaard wrote:
> 
>> Buildroot 2018.11.1 is released - Go download it at:
[snip]
> The last failure is on a systemd test, where it says that the boot
> didn't work:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/136980206
> 
> However, looking at the boot log at
> https://gitlab.com/buildroot.org/buildroot/-/jobs/136980206/artifacts/file/test-output/TestInitSystemSystemdRwFull-run.log,

The artifacts are now expired.
But I downloaded in time and made a copy here:
https://www.filedropper.com/artifacts
md5sum 0ebf84f1f7b7ff8f9309f49a3675a243

> it did boot, the login prompt appears.
> 
> Perhaps something for Ricardo ? :-)

The "Welcome" message appeared but not the "login:" because the getty was not
started. Getty didn't start because /dev/ttyAMA0 was not ready.

These are the messages in the log:
|A start job is running for dev-ttyAMA0.device (1min 35s / 1min 30s)
| TIME    Timed out waiting for device dev-ttyAMA0.device.
|[DEPEND] Dependency failed for Serial Getty on ttyAMA0.


I found in the wild 2 issue reports that have similar symptoms, but I think
they are not the same issue found in this run.

https://github.com/systemd/systemd/issues/10914
This is not the case because that issue is caused by the use of /dev/console
instead of /dev/tty*, I checked and our test case is correctly using /dev/tty*

https://jira.automotivelinux.org/browse/SPEC-544
This one seems to be related only to old systemd versions and already fixed
upstream.

So I created 2 commits:
1) change the test case to boot the image 100 times instead of a single time;
2) add a pre-built image to skip the build in the Gitlab CI (this is the actual
   image that failed in the original report).

So far there were more than 2000 boots without this problem (100 per run):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/42333203/builds

The only time the boot failed the logs do not show the same DEPEND message:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/142073152


I am not sure it's worth digging further if we don't see this issue again.


Regards,
Ricardo
