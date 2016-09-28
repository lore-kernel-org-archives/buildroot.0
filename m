From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Sep 2016 15:27:14 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version
	4.6.0.245
In-Reply-To: <1474954789-14602-2-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Tue, 27 Sep 2016 07:39:49 +0200")
References: <1474954789-14602-1-git-send-email-angelo.compagnucci@gmail.com>
 <1474954789-14602-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87vaxgyx1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > * Bump to mono 4.6.0.245
 > * Enabling previously disabled aot cause this version doesn't
 >   compile without
 > * Fixing removed licensing file in mcs/COPYING.LIB

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 >  package/mono/mono.hash | 2 +-
 >  package/mono/mono.mk   | 8 ++++----
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/mono/mono.hash b/package/mono/mono.hash
 > index c275e15..4d05458 100644
 > --- a/package/mono/mono.hash
 > +++ b/package/mono/mono.hash
 > @@ -1,2 +1,2 @@
 >  # sha256 locally computed
 > -sha256 900c2cc25ee55adeec04e1ae889316efc127c82cc0c392f928421f19f8f5b633  mono-4.4.2.11.tar.bz2
 > +sha256 2981f518cace63bfe10953fecd57c7fef040077a1ac617967dde5466062c1327  mono-4.6.0.245.tar.bz2
 > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
 > index 3d0b9bc..8f90b9f 100644
 > --- a/package/mono/mono.mk
 > +++ b/package/mono/mono.mk
 > @@ -4,11 +4,11 @@
 >  #
 >  ################################################################################
 
 > -MONO_VERSION = 4.4.2.11
 > +MONO_VERSION = 4.6.0.245
 >  MONO_SITE = http://download.mono-project.com/sources/mono
 >  MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 >  MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
 > -MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING.LIB mcs/COPYING \
 > +MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING \

But why was it removed? Looking at mono git I see it was removed by:

commit ef0ddf45c3081e799edcb4e95770186514b80cf1
Author: Miguel de Icaza <miguel@gnome.org>
Date:   Wed Mar 23 11:12:01 2016 -0400

    First set of licensing changes

Which was followed by:

commit 71f79f97bbfb6dc3ba33691cb0b584ddc0b61a68
Author: Miguel de Icaza <miguel@gnome.org>
Date:   Fri Mar 25 15:03:54 2016 -0400

    Move all licenses to a single LICENSE file

And the top level LICENSE file now lists:

In general, the runtime and its class libraries are licensed under the
terms of the MIT license, and some third party code is licensed under
the 3-clause BSD license.  See the file "PATENTS.TXT" for Microsoft's
patent grant on the Mono codebase.

Googling around, I see:

http://www.mono-project.com/news/2016/03/31/mono-relicensed-mit/

So I *THINK* it should be:

MONO_LICENSE = GPLv2 or MIT (compiler, tools), MIT (libs) or commercial

COPYING.LIB is now also just a oneliner referring to LICENSE, so it
should be dropped from _LICENSE_FILES.

But I don't know anything about mono, so it would be good if people
actually using it can confirm.

-- 
Bye, Peter Korsgaard
