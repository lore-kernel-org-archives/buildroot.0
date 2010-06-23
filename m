From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 11:36:17 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <20100623104613.78fe0d97@surf> (Thomas Petazzoni's message of
	"Wed, 23 Jun 2010 10:46:13 +0200")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
	<874ogu6vsv.fsf@macbook.be.48ers.dk> <20100623104613.78fe0d97@surf>
Message-ID: <87vd9a5bvy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> On Wed, 23 Jun 2010 09:40:48 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> As mentioned before, the problem with this is that people have
 >> historically expected that they can just export
 >> PATH=path/to/staging/usr/bin:$PATH and use the cross compiler outside
 >> buildroot. If you start installing target binaries into
 >> staging/usr/bin then this would break horrible.
 >> 
 >> (Yes, I know people should atleast append it to the path (export
 >> PATH=$PATH:path/to/staging/usr/bin), but people will forget and it
 >> used to work.

 Thomas> As mentionned before, adding $(STAGING_DIR)/usr/bin to the path is just
 Thomas> wrong. The possible solutions to this are :

True, but it's happening today, and adding target binaries to staging
without a very clear notice to people is bound to be a support headache.

 Thomas>  * Install the toolchain outside of $(STAGING_DIR) and then re-use what
 Thomas>    we do for external toolchains, and then tell people to not add
 Thomas>    $(STAGING_DIR)/usr/bin to their PATH, but rather the location where
 Thomas>    the toolchain was installed. This has the added benefit that
 Thomas>    $(STAGING_DIR) would not contain binaries compiled for the host,
 Thomas>    mixed with binaries compiled for the target.

That means that people have to start passing -sysroot options, otherwise
the compiler cannot find the header files / libraries.

 Thomas>  * Keep the toolchain binaries in $(STAGING_DIR), but create shell
 Thomas>    wrappers installed in another directory for the toolchain binaries,
 Thomas>    and tell people to add the directory where these wrappers are
 Thomas>    installed to their PATH.

Would these wrappers then set sysroot? That could perhaps work. I wonder
if the shell overhead would be significant.

-- 
Bye, Peter Korsgaard
