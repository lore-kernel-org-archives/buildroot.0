From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 5 Dec 2012 21:14:30 -0500
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <8738zo7835.fsf@dell.be.48ers.dk>
References: <1354445767-15308-1-git-send-email-sho@relinux.de>
 <8738zo7835.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I ran into a minor problem with the shallow clone changes.  The test for
doing a git shallow clone uses a grep.  From pkg-download.mk:

   ((test `git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep
$($(PKG)_DL_VERSION)` && \

If the grep returns multiple matches, then the "test" will fail, and then
go on to do a full clone. The failure prints out:

   bash: test: too many arguments

It's because the grep filter matches multiple items in the ls-remote
output.  For example, if you try to get your kernel from "
http://arago-project.org/git/projects/linux-davinci.git", specifying a
version of "03.22.00.02", then you will get two matches:

   $ git ls-remote
http://arago-project.org/git/projects/linux-davinci.git| cut -f 2- |
grep 03.22.00.02
    refs/heads/03.22.00.02
    refs/tags/DEV_DAVINCIPSP_03.22.00.02

There are ways to massage the grep to do better (maybe use "grep -q", or
grep for "/string$" instead of just "string"), but the ls-remote command
seems to take a ref directly.  I.e.

   $ git ls-remote
http://arago-project.org/git/projects/linux-davinci.git03.22.00.02 |
cut -f 2-
   refs/heads/03.22.00.02
   $
   $ git ls-remote
http://arago-project.org/git/projects/linux-davinci.gitDEV_DAVINCIPSP_03.22.00.02
| cut -f 2-
   refs/tags/DEV_DAVINCIPSP_03.22.00.02
   $
   $ git ls-remote
http://arago-project.org/git/projects/linux-davinci.gitJUNK | cut -f
2-
   $

So I'm wondering why the recent changes in this area used grep at all,
rather than asking ls-remote directly.  I.e.:

 ((test `git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION) | cut -f 2-` && \

If there is feedback that the above is desirable, then I can send in the
patch.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121205/6418600c/attachment.html>
