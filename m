From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 25 Apr 2018 19:12:56 -0300
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
References: <20180425230643.39b21596@windsurf>
Message-ID: <5ae0fd68220fa_1c132ac0f16476fc46085@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Apr 25, 2018 at 06:06 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 25 Apr 2018 18:01:10 -0300, Ricardo Martincoski wrote:
> 
>> I am currently refreshing my series with test cases for the git download infra.
> 
> Excellent! We will have to extend it to cover other download methods.
> For example, the CVS backend got broken as a result of the recent
> download infra changes.

ACK

>> A simple solution probably will add one or few files to
>> http://autobuild.buildroot.net/artefacts/
>> to be used by the test case.
> 
> That can easily be done. I have no idea how scalable and future proof
> this "artefacts" location is going to be, but we can start by using
> that, and move to a better solution in the future if needed.

Indeed it won't scale well if we need different files for different test cases.
I will try the docker image first. If it shows up too complex, then I fallback
to this one.

>> Another way is to add a http server to the docker image to serve files added to
>> support/testing to be used by the test case.
> 
> This also works. Seems a bit more complicated, no ?

A bit more complicated, yes. Maybe not too much.
I will play with the docker image to check.

The only downside is that we "lose" the ability to run few test cases in a local
computer without the docker image.
But the test cases are meant to be run in the GitLab CI anyway, and one can
always download the docker image and run the test cases inside it. It also
generates more reproducible results. So in the end we don't lose much IMO.

>> Yet another solution would be to build and run an image with a http server. The
>> files to be served would be added to support/testing and copied to the image.
> 
> I did not understand this solution.

We could have a defconfig on the test case with a http server enabled and adding
files from a subfolder of support/testing to the image. The test infra then
builds an image and runs it on qemu. A port forwarding must be set up on the
command that calls qemu in order to the docker image to have access to the http
server inside the qemu.
Then the test case would request a second build that only downloads things: the
main download from the git server and the extra download from the http server
inside qemu.
Solution 2 (server on the docker image) seems easier and more future-proof than
this one, as we could end up with a failure unrelated to the download infra
caused by a bug on the http server when its package version is bumped.


Regards,
Ricardo
