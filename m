From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:57:07 +0100
Subject: [Buildroot] [PATCH] infra: do not append an empty
	LD_LIBRARY_PATH
In-Reply-To: <1416610416-27914-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 21 Nov 2014 23:53:36 +0100")
References: <1416610416-27914-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87lhmsi9fg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we set LD_LIBRARY_PATH when building our host tools, we append any
 > pre-existing value to our custom path:
 >         LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"

 > But then if LD_LIBRARY_PATH was previously empty, we end up with an
 > LD_LIBRARY_PATH that ends with a colon.

 > Also, when we check that an existing LD_LIBRARY_PATH does not contain
 > CWD, we previously did not look for a zero-length prefix.

 > Since 'man ld.so' says of LD_LIBRARY_PATH:
 >     A colon-separated list of directories in which to search for ELF
 >     libraries at execution-time. Similar to the PATH environment
 >     variable.

 > And POSIX states about PATH:
 >     A zero-length prefix is a legacy feature that indicates the current
 >     working directory.

 > And bash also recognises a zero-length prefix to searh in CWD:
 >     A zero-length (null) directory name in the value of PATH indicates
 >     the current directory.

 > We may thus end up on a system where a zero-length prefix in
 > LD_LIBRARY_PATH is interpreted as VWD.

 > Do not append the previous LD_LIBRARY_PATH if it was empty, and check
 > for a zero-length prefix when checking dependencies.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > Note: I have had no bug that was due to this, but better be safe than
 > sorry.

Committed with the /VWD/CWD/ typo fixed, thanks.

-- 
Bye, Peter Korsgaard
