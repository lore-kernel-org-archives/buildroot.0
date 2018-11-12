From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2018 23:30:36 +0100
Subject: [Buildroot] [PATCH 0/6 v2] fs: fix and better handle
 capabilities
In-Reply-To: <cover.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <7cb8d7d2-de00-a35e-4407-3312f785dd85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 18:32, Yann E. MORIN wrote:
> Hello All!
> 
> As reported by Ricardo in #11216, and recently noticed thanks to the
> runtime tests he added, handling file capabilities is broken.
> 
> Ricardo did a very good job at pinpointing the issue, and that is caused
> by the recent-ish split of the filesystem infra with the use of the
> intermediate tarball.
> 
> It turns out that playing with fakeroot, tar, and capabilities is a lost
> game, as fakeroot behaves badly with the special handling tar does with
> the security.capability extended attribute.
> 
> This series fixes the issue with the first patch, in which we simply get
> rid of the intermediate tarball, and directly rsync from the global
> target/ directory to populate the per-filesystem target directory. This
> means that any common fincalisation under fakaeroot is no longer
> possible, so they have to be replicated for each filesystem instead.
> 
> The only remaining common part is now the generation of the various
> tables: devices, permisions and users.

 Just to be clear: this is the only patch for master, right? The rest is for next?

> 
> Then, the tar filesystem is fixed to store the xattrs.

 Like this one, tar has never contained xattrs, right?

 Regards,
 Arnout

> 
> Then there are tow clean-up patches, which pave the way to two fixes.
> 
> First, we allow permissions provided by users to override the internal
> permissions, as we do for all user-provided settings. Second, we fix the
> static device creation conditions.
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit cd0ca09e43be8bd87fa35c96fa099a338b85de36
> 
>   {linux, linux-headers}: bump 4.{4, 9, 14, 18}.x series (2018-11-11 22:11:04 +0100)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to ae80646fbb9d0e7f40434b16ebe5173ee3a4654c
> 
>   fs: make static device nodes creation more logical (2018-11-12 18:28:28 +0100)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (6):
>       fs: get over the intermediate tarball
>       fs/tar: add support for xattrs (thus capabilties)
>       fs: rename internal variable
>       fs: split devices and permissions tables
>       fs: allow user provided permissions to override packages permissions
>       fs: make static device nodes creation more logical
> 
>  fs/common.mk                                    | 92 +++++++++++--------------
>  fs/tar/tar.mk                                   |  2 +-
>  support/testing/tests/core/test_post_scripts.py |  4 +-
>  3 files changed, 44 insertions(+), 54 deletions(-)
> 
