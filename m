From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 25 Nov 2015 14:31:38 -0500
Subject: [Buildroot] [PATCH v2] openssl: fix race condition when symlink
 shared libs
In-Reply-To: <565070A7.10001@mind.be>
References: <1448036610-7077-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <565070A7.10001@mind.be>
Message-ID: <20151125193138.GO23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 Nov 2015 14:24, Arnout Vandecappelle wrote:
> On 20-11-15 17:23, Ryan Barnett wrote:
> > The build-shared target depends on do_crypto and link-shared, which
> > will be executed in parallel. do_crypto calls
> > link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
> > link-shared calls symlink.linux_shared which also does SYMLINK_SO.
> > Before the symlink is created, it is rm'ed, but there is a tiny chance
> > that the second one is created after the rm has been called.
> > 
> > Fix this by using 'ln -sf' instead of 'ln -s' so the build doesn't
> > error out.
> > 
> > Patch submitted upstream at:
> >   https://bugs.gentoo.org/show_bug.cgi?id=566260
> 
>  Ahem, gentoo is not exactly upstream :-)  From [1]:
> 
> To report a bug or make an enhancement request, send email to rt at openssl.org.

which these have been already.  they don't respond.  in fact, you can see
a link to the relevant upstream report in every Gentoo parallel patch.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151125/729563ba/attachment.asc>
