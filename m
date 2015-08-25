From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 25 Aug 2015 17:31:42 +0200
Subject: [Buildroot] Java 7 (IcedTea / OpenJDK / JamVM)
Message-ID: <CAJtjsKZkwagH=wOECedbiEUndwdjTVXR2X+MChhxSYdnywAgsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'd like to integrate a project that needs a Java VM with support for Java 7.
So far I see that JamVM is available in Buildroot but with classpath,
which support up to Java 1.5 only.
I'm not a Java guru (and I would like to remain so) but it looks like
JamVM can work with OpenJDK too.
So, I've investigated how to integrate OpenJDK to buildroot and,
AFAIK, I should try to integrate IcedTea as it is basically OpenJDK
with a better build system (i.e., it can be compiled with free
softwares only), and it supports more architectures.

The way IcedTea is design, its makefile downloads the original openjdk
archive, along with several other archives, extracts them and patches
them. Then it builds the modified openjdk with a Java 1.5 compiler
(gcj by default) to get a preliminary java compiler. Finally, it uses
this bootstrap jdk to fully compile openjdk.

There is an option to disable the download of archives but you have to
provide the location to them. I wonder how I should download such
extra tarballs in Buildroot?
I think making an extra package for each of them is overkill as I
don't need to extract them, the icedtea makefile does it by itself.
Should I use a (pre/post) download hook to download these archives or
is there a better way to proceed?

The other issue I'm facing is how to deactivate the X11 dependencies.
I see that debian provides an openjdk-jre-headless package and that's
what I would like to have in buildroot. However, debian simply
compiles everything and omits to install the X11 part in the headless
package. There's a blog post from a guy in the OpenEmbedded project
that does it on a previous OpenJDK version but he actually patches
IcedTea and OpenJDK sources:
https://evolvis.org/plugins/mediawiki/wiki/jalimo/index.php/CrossCompilingOpenJDK
Ideally, I would like to have the possibility to activate or not the
graphical part of OpenJDK. Any better idea before I start a long and
tedious process of patching IcedTea and OpenJDK?

Thanks.

Regards,
-- 
Johan
