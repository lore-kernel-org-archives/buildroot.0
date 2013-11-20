From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 09:02:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-19
In-Reply-To: <20131120073002.EB8E9101271@stock.ovh.net>
References: <20131120073002.EB8E9101271@stock.ovh.net>
Message-ID: <CAAXf6LUUzKXe9XiP8BdPvjBguGzAKnzkxDteggsqiFgZBvygvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 20, 2013 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>      avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/584d71f91c9a9bc115e49b77be8576cab76a8210/

Error is:

Thread.cpp: In member function 'void scx::Thread::set_priority(int)':
Thread.cpp:117: error: 'pthread_setschedprio' was not declared in this scope
make[3]: *** [Thread.lo] Error 1

However, sconeserver already depends on threads. It seems this
function pthread_setchedprio has not always been available. The man
page of my system says glibc >= 2.3.4. Could it be that the toolchain
(uclibc-based) is too 'old'? How to handle this case: depending on the
toolchain version the package may or may not build...


>       i686 |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/b234e63f92e6e5162dd5340624e32caa31b82a1a/

Error happens when creating the man pages:

/home/test/test/1/output/host/usr/bin/xsltproc -nonet
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
udisks7.xml
I/O error : Attempt to load network entity
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity
"http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
make[4]: *** [udisks.1] Error 4
make[4]: *** Waiting for unfinished jobs....


Man pages in udisks are only built when 'BR2_HAVE_DOCUMENTATION' is
set, but this is deprecated.
Therefore I propose to always build without man pages for udisks. I
will provide a patch...

Best regards,
Thomas
