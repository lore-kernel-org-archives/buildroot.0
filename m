From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 7 Feb 2018 14:47:46 -0500
Subject: [Buildroot] [PATCH v2 1/1] support/dependencies: add check for
 c++ multilib
In-Reply-To: <20180206220004.GD28439@scaer>
References: <20180205215708.16363-1-gael.portay@savoirfairelinux.com>
 <20180206220004.GD28439@scaer>
Message-ID: <20180207194746.yqwbu52xnntehxy5@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Feb 06, 2018 at 11:00:04PM +0100, Yann E. MORIN wrote:
> Ga?l, All,
> 
> On 2018-02-05 16:57 -0500, Ga?l PORTAY spake thusly:
> > Some packages build C++ 32bits host-tools and need the g++-multilib to
> > be installed on the build machine. As example, qt5webengine builds a C++
> > host-tool when target is 32bits.
> > 
> > Add the check for g++-multilib to the dependencies script; and update
> > the Dockerfile to install g++-multilib package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> So, this patch was applied, but there is some second-thoughts about it,
> especially since not al our autobuilders have g++-multilib for now...
> 
> But my concern so far is just about the Dockerfile, see below...
> 
> > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> > index 474e073c61..ce3fdd9cc2 100644
> > --- a/support/docker/Dockerfile
> > +++ b/support/docker/Dockerfile
> > @@ -22,7 +22,7 @@ COPY apt-sources.list /etc/apt/sources.list
> >  RUN dpkg --add-architecture i386 && \
> >      apt-get update -y && \
> >      apt-get install -y --no-install-recommends \
> > -        build-essential cmake libc6:i386 gcc-multilib \
> > +        build-essential cmake libc6:i386 g++-multilib \
> >          bc ca-certificates file locales rsync \
> >          cvs bzr git mercurial subversion wget \
> >          cpio unzip \
> 
> So, we should not confuse the Dockerfile for what it is not: it is not
> meant for user consumption; we never advertised it. Instead, it is only
> for use by our gitlab-ci based runtime tests. As such, it should only
> include what is needed in that context.
> 
> At least for now.
> 

I understand.

> Maybe we will want to make it ready for public consumption later, but it
> is not for now.
> 

I am using the Dockerfile for the last 6 months, and it is working great
(I am using a script of my own that bind mounts my PWD in the docker and
opens a shell where I am able to run make).

> As such, I don't think we should have updated the dockerfile in the same
> patch. Afterall, it is not a mandatory dependency; it is needed (as far
> as I can understand) only for qt5webengine.
> 

You are right; I was not aware that it was not an official way to build
buildroot images.

> There are ther optional dependencies that are not in the dockerfile. For
> example, we do not have a jave compiler, which is needed by a few
> packages in Buildroot, but which are for now not tested by the gitlab-ci
> jobs.
> 
> So, I would suggest we retract this change in the Dockerfile...

I really like to keep it because it is required by qt5webengine and and
I am compiling it :) (I know that I can also write by own Dockerfile on
top of the prebuild docker image buildroot/base).

My guess is that it is fair to keep the g++-multilib meta package
installed in the Docker image as it installs only three additionnal
packages (g++-6-multilib, lib32stdc++-6-dev and libx32stdc++-6-dev) for
a total of 17.1 MB.

	# apt install g++-multilib
	The following additional packages will be installed:
	  g++-6-multilib lib32stdc++-6-dev libx32stdc++-6-dev
	Suggested packages:
	  lib32stdc++6-6-dbg libx32stdc++6-6-dbg
	The following NEW packages will be installed:
	  g++-6-multilib g++-multilib lib32stdc++-6-dev libx32stdc++-6-dev
	0 upgraded, 4 newly installed, 0 to remove and 1 not upgraded.
	Need to get 1,183 kB of archives.
	After this operation, 17.1 MB of additional disk space will be used.
	Do you want to continue? [Y/n] ^C

As opposed to java compiler that installs 15 additional packages for a
total of 107 MB.

	# apt install javacc
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	The following additional packages will be installed:
	  ca-certificates-java default-jre-headless fontconfig-config fonts-dejavu-core java-common libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libfontconfig1 libfreetype6 liblcms2-2 libpcsclite1 libxrender1 openjdk-8-jre-headless
	Suggested packages:
	  default-jre javacc-doc cups-common liblcms2-utils pcscd libnss-mdns fonts-dejavu-extra fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei fonts-indic
	The following NEW packages will be installed:
	  ca-certificates-java default-jre-headless fontconfig-config fonts-dejavu-core java-common javacc libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libfontconfig1 libfreetype6 liblcms2-2 libpcsclite1 libxrender1 openjdk-8-jre-headless
	0 upgraded, 16 newly installed, 0 to remove and 1 not upgraded.
	Need to get 30.3 MB of archives.
	After this operation, 107 MB of additional disk space will be used.
	Do you want to continue? [Y/n] ^C

> 
> Thoughts from others? Arnout, Thomas, Peter?

BTW, I think we can reconsidering using prebuild Docker images for
developpers.

> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regards,
Gael
