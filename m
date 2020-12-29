From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 15:37:15 +0100
Subject: [Buildroot] [PATCH 03/10 v3] support/download: add helper to
 generate a reproducible archive
In-Reply-To: <17332b81-a5e7-5803-3654-d80ab8ba2128@xes-inc.com>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <bcb281853f0da8cd970446f4afed093b317dcc82.1609239666.git.yann.morin.1998@free.fr>
 <17332b81-a5e7-5803-3654-d80ab8ba2128@xes-inc.com>
Message-ID: <20201229143715.GP1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2020-12-29 08:26 -0600, Vincent Fazio spake thusly:
> On 12/29/20 5:01 AM, Yann E. MORIN wrote:
[--SNIP--]
> >Introduce a helper that can generate a reproducible archive from
> >an input directory.
[--SNIP--]
> >diff --git a/support/download/helpers b/support/download/helpers
> >new file mode 100755
> >index 0000000000..0e0432c884
> >--- /dev/null
> >+++ b/support/download/helpers
> >@@ -0,0 +1,70 @@
> >+# Generate a reproducible archive from the content of a directory
> >+#
> >+# $1    : input directory
> >+# $2    : leading component in archive
> >+# $3    : ISO8601 date: YYYY-MM-DDThh:mm:ssZZ
> >+# $4    : output file
> >+# $5... : globs of filenames to exclude from the archive, suitable for
> >+#         find's -path option, and relative to the input directory $1
[--SNIP--]
> Do you think there would be any benefit of just having `mk_tar` which does
> the grunt work and have `mk_tar_gz` wrap that for compression? Should xz
> compression be introduced in the future the same `mk_tar` backend can be
> reused with just a new `mk_tar_xz` wrapper to do the compression. Or do we
> imagine that we would never have two methods available at once?

I also considered that, but for now we only need to generate .tar.gz
tarballs.

If the need arises to compress with alternate compression, then we would
probably introduce mk_tar_xz (or the likes), and then we can decide to
introduce mk_tar as an internal helper for mk_tar_gz and mk_tar_xz. This
would not impact the API of mk_tar_gz, so we would not need to update
callers.

But since we do not yet have a clear sign that we will need another
compression, let's just make things simple, and just provide mk_tar_gz.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
