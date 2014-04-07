From: brianclements <brian@brianclements.net>
Date: Mon, 7 Apr 2014 00:26:10 -0700 (PDT)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <20140402073504.199469BF82@busybox.osuosl.org>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
Message-ID: <1396855570069-66989.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7016

>Can you provide more details on how you actually run this image? I am not
>familiar with Docker, so more details about how you run this is very
welcome.

Sure. You can go to https://www.docker.io/gettingstarted/ to install docker
on a 64 bit linux system. It uses linux containers to borrow the host's
kernel and run isolated processes with very little overhead. 

Then to build, clone the "gitbug" branch of this github repo:
`git clone https://github.com/brianclements/dockerfile-busyboxplus.git
--branch gitbug`

Then as sudo -i (so you don't have to babysit your sudo timeout) run the
script:
`./run.sh git`

It will then start one container to build the rootfs.tar, then the script
copies it out of the build container and into the host filesystem (in the
/git folder in the repo) and import that resulting image back into docker
under the name "brianclements/busyboxplus:git"

To see the details of how I build it, you can look at this Dockerfile (which
works much like a bash script)
https://github.com/brianclements/dockerfile-busyboxplus/blob/gitbug/git/tarmaker/Dockerfile

You can then run commands in this new imported image by prefixing your
command with:
`sudo docker run brianclements/busyboxplus:git <COMMAND GOES HERE>`

or, more intuitively, you can "enter" the container and be interactive by
running:
`sudo docker run -it brianclements/busyboxplus:git /bin/sh`
which should give you a root prompt inside the busybox container. There you
can `git clone` and test away. Numerous tests have been cataloged in the
github issue tracker in this repo for your perusal (the only 2 issues in
that repo relate to this git issue).
https://github.com/brianclements/dockerfile-busyboxplus/tree/gitbug

>Have you tried using a similar configuration on a non-docker environment,
like
>qemu or a real target?

Yes, a build on my host, Ubuntu 13.10, gave the same exact behavior with the
resulting rootfs.tar. I don't have any experience with qemo, but perhaps you
could reproduce it on those systems quicker then I? Even when using the
`make menuconfig` all I selected was x86_64 architecture, wide character,
largefile, inet_ipv6, bridge_utils, iproute2, iptables, then git. In fact
all you need to do is the bare minimum and it still gives the error (x86_64,
largefile, git).

>Also, did you try to run git through 'strace' to see what is actually going
on?

I admit I have basic knowledge of strace, let me know if you need it run
with different options. I compiled a container identical in all ways with
the exception of the strace package to get the attached file.

strace-git.strace-git
<http://buildroot-busybox.2317881.n4.nabble.com/file/n66989/strace-git.strace-git>  

>Have you tried making a new local git repo using the git inside this image,
and
>then clone that with the same git? Or have you only tried cloning an
external
>git repo? If there is a problem with importing git data, the inflate can
>obviously fail. Generating a local git repo would help excluding that.

The issues on github give some of the details of what I've tried, but in
short, it seems to be the "complexity" of the repo being cloned (number of
objects I'm thinking, not the size) and NOT it's source that causes the
issue (local or internet). Docker has the ability to insert files into a
container and I've added the repository that the original bug reporter
listed (which was large with over 56,000 objects) and had the same issue
cloning internally as I did over the Internet. This to me ruled out any data
corruption over the network bridge as it passed into the container and
refocuses squarely on how git decompresses these objects in my image.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-7016-New-Git-issues-in-resulting-buildroot-tar-tp66457p66989.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
