From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 12:08:31 +0100
Subject: [Buildroot] [PATCH] package/meson: fix shabang in deep build
 trees
In-Reply-To: <20200113180322.5618-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 13 Jan 2020 19:03:22 +0100")
References: <20200113180322.5618-1-yann.morin.1998@free.fr>
Message-ID: <877e14lyhc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The meson script includes the full path to the python interpreter. In
 > deep build trees, this path can be more than 128 characters long, which
 > is the limit a shabang might be.

NIT: It is called shebang, not shabang.

NIT2: This has actually been bumped to 256 bytes in linux 5.1:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eb3c3d0a52dca337e327ae8868ca1f44a712e02

 > +# Avoid interpreter shabang longer than 127 chars

127? Off by one? ;) In fact, 128 bytes is the size of the entire buffer
read from the file, so including the leading #! and trailing \0 and the
actual path can AFAIK only be 125 bytes long. I changed it to 128 for
consistency.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
