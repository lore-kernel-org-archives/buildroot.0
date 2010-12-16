From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Dec 2010 22:01:15 +0100
Subject: [Buildroot] Build failures...
In-Reply-To: <72247.47890.qm@web121804.mail.ne1.yahoo.com> (Joe's message of
	"Thu, 16 Dec 2010 11:58:36 -0800 (PST)")
References: <72247.47890.qm@web121804.mail.ne1.yahoo.com>
Message-ID: <87k4j9h1pg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joe" == Joe  <lordvictory1@yahoo.com> writes:

Hi,

 Joe> I'm new to buildroot, so I hope I don't cause any extra work on
 Joe> anyones behalf if I'm incorrect about these...I would just like to
 Joe> help participate to make this project better...so I thought I'd
 Joe> post what I've encountering so far.

 Joe> My host environment if a VMware Centos v5.5 system, and I've encountered a 
 Joe> couple issues during building of the most current buildroot release.

 Joe>   1) When building ncurses it got hung up when running the
 Joe> terminfo compiler (tic).  I let it run for over an hour, but
 Joe> decided to cancel it when top indicated it had already consumed
 Joe> >43 minutes of CPU time and was still not finished.

That's because of a version incompatibility between the ncurses version
you have on your host and what we have in buildroot. There recently was
a patch posted to fix this by building a host version, but that hasn't
been integrated yet.

 Joe>   2) When building host-zlib-1.2.5 it failed during the make
 Joe> install phase it invokes install-libs, which attempted to copy (cp
 Joe> command) SHAREDLIBV (which was empty) and received a failure on
 Joe> the cp command due to only a single argument.  I simply commented
 Joe> the line out and then the make of that component completed.

You have enabled BR2_PREFER_STATIC_LIB and you are using 2010.11, right?
If so you can fix it by the following patch:

http://git.buildroot.net/buildroot/tree/package/zlib/zlib-1.2.5-fix-static-install.patch

(download and put in package/zlib).
  
 Joe>   3) When configuring buildroot I checked off the item (in
 Joe> menuconfig) to build the uClibc tests.  When it was building the
 Joe> tests it got a compile error (not sure now what file or error).  I
 Joe> simply went back into the configure and unselected to build the
 Joe> tests and then it went past this.

Hmm, will check.

 Joe>   4) When invoking /usr/bin/msgfmt it got a parse failure in
 Joe> ./de.po on the keyword "msgctxt".  Not sure what it's building or
 Joe> how to get around this.

That also sounds like a version incompatibility. Care to post your
buildroot .config?

 Joe> I'm unable to complete the make process, so currently I dead in
 Joe> the water with this tool, and I'm not sure where to go from here
 Joe> with it.  Perhaps it's my build environment?  What Linux version
 Joe> has this been known to build without failures on?

Well, centos 5.5 is SW from 2006/2007, so it's fairly outdated. Most
developers use something more recent like uptodate versions of
Debian/Ubuntu/Fedora.

-- 
Bye, Peter Korsgaard
