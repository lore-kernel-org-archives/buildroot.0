From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 19:38:17 +0100
Subject: [Buildroot] [PATCH] core: ensure we use the realpath(3) of
 DL_DIR
In-Reply-To: <20181115170348.15731-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 15 Nov 2018 18:03:48 +0100")
References: <20181115170348.15731-1-yann.morin.1998@free.fr>
Message-ID: <87efbinsdi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When $(TOPDIR)/dl is a symlink, checking out git submodules can fail,
 > as reported by Michael in #11086.

 > To reproduce a similarly-related mis-behaviour:

 >     $ mkdir -p foo/bar foo/buz
 >     $ cd foo/bar
 >     $ ln -s ../buz meh
 >     $ cd meh
 >     $ cd ../../foo

 > The last command should not succeed, because, relative to meh, there is
 > no ../../foo directory; we would expect it to be ../../../foo, instead.
 > But since meh is a symlink to a directory, then a relative path from that
 > symlink is interpreted as relative to the derefrenced directory, i.e.
 > from buz in this case.

 > But where this gine even werider, is that, if the last command is
 > replaced by:

 >     $ cd ../../../foo

 > then it still works, too.

 > And that is the root of Michael's issue: the dl directory in Buildroot's
 > TOPDIR is a symlink to a similarly-named directory one directory higher,
 > which then confuses relative paths, which gets especially and noticeably
 > bad for git submodules.

 > Avoid this strangeness, and just use so-called "physical" path, i.e. a
 > path where all symlinks to directories have been dereferenced.

 > Fixes: #11086

 > Reported-by: Michael Nosthoff <posted@heine.so>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Michael Nosthoff <posted@heine.so>

Committed, thanks.

-- 
Bye, Peter Korsgaard
