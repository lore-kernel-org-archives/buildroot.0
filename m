From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Mar 2011 12:17:43 +0100
Subject: [Buildroot] 2011.02 pkg-config problems?
In-Reply-To: <WC20110307121409.5600B6@terrafix.co.uk> (Joe Woodward's message
	of "Mon, 07 Mar 2011 12:14:09 +0000")
References: <WC20110307121409.5600B6@terrafix.co.uk>
Message-ID: <8762rr8bs8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joe" == Joe Woodward <jw@terrafix.co.uk> writes:

Hi,

 Joe> {TARGET}/home/MYBUILDUSERNAME/PATH/TO/BUILD/FOLDER/ON/HOST/MARCHINE/\
 Joe>   ./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/\
 Joe>   ./share/fonts/X11/100dpi ...and so on

 Joe> Has any else experienced this?

 Joe> I'm fairly certain its due to the bumping of pkg-config and
 Joe> tweaks to it's --sysroot patches.

 Joe> Any ideas about what to do?

Thanks for reporting this. The problem is that pkg-config doesn't have
any explicit support for cross compilation, so we have to guess if a
given variable refers to a target path or a host path. For this specific
problem you could work around it by passing an explicit
--with-fontrootdir=/usr/share/fonts/X11 to the configure step of the
xfonts packages, but I have fixed pkg-config in git to only prepend the
sysroot location when the includedir + libdir variables are requested,
and not all variables like we did for 2011.02:

http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabe

-- 
Bye, Peter Korsgaard
