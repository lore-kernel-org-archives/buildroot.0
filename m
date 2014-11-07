From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 7 Nov 2014 10:57:21 -0300
Subject: [Buildroot] [RFC/PATCH] Makefile: guarantee reproducible
 permissions
In-Reply-To: <CA+TH9VnK7iiTSXwfn_iNNoEDiQ7WnkTFz4_tANRfY-nUW3wNYA@mail.gmail.com>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
 <54580079.2070603@mind.be> <20141105144624.GA1257@fox>
 <CA+TH9VnK7iiTSXwfn_iNNoEDiQ7WnkTFz4_tANRfY-nUW3wNYA@mail.gmail.com>
Message-ID: <20141107135721.GB2620@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Wed, Nov 05, 2014 at 04:51:25PM +0100, Angelo Compagnucci wrote:
> Hi Guido,
> 
> > Are you sure? I think rsync is used to copy the sysroot to the staging
> > dir (output/host). The target is then filled with various 'install -m's
> > for each library, so the previous set of permissions wouldn't matter.
> 
> The mono package uses rsync to install some libraries in target, so
> it's an exception.

I think this is not an issue since we're copying them from output/host,
where we now build with a controlled umask. This means that the current
permissions of source files in the BR repo and the umask won't affect
the outcome. I just built mono with an umask of 077 on a repo with
'chmod -R go=' and I think the end result was ok: 644 for most files,
755 for DLLs and 755 for directories.

Some packages call 'rsync -a' to copy files from their BR directory
(under package/) where we don't track or care about permissions, so
the result is not well-defined. But as long as the source is under
output/host or output/build we should be ok, meaning: we won't depend on
volatile things like the umask or the untracked permissions of the repo.

Of course, you probably know better about mono than I do, so if you do
find a problem let me know!

Thanks!
-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
