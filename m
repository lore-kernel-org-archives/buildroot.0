From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 01:00:18 +0200
Subject: [Buildroot] [PATCH] Strip binaries in the fakeroot script
 instead of in target-finalize
In-Reply-To: <20190930115342.17237-1-unixmania@gmail.com>
References: <20190930115342.17237-1-unixmania@gmail.com>
Message-ID: <ef353ba4-bef4-0c17-ee0a-b1d9e08c3303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/09/2019 13:53, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Since commit 118534fe54 the root filesystem image is generated from an
> intermediary copy of TARGET_DIR, so we can move the stripping of target
> binaries from target-finalize to the fakeroot script.
> 
> This allows us to easily find the non-stripped executables to debug with
> gdbserver, as they are at the same relative path in TARGET_DIR as in the
> target device, rather than searching inside the build directory.

 This is in fact a pretty elegant solution, even compared to the
target-is-a-subset-of-staging approach that we'd like to move to long-term.
Indeed, anything which is not in target should never be relevant for the
debugger. E.g. .a files are not needed for debugging, and header files will
anyway be searched in the full STAGING_DIR path.

 It's a bit unelegant to do this in the fakeroot script, though, because it has
nothing to do with fakeroot. However, it can just as well be done a few lines
higher, after the rsync and before the fakeroot script is generated.

 So, with that changed, you can add my

 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Still, I'd like to have Yann take a look as well.


> We can also set sysroot to TARGET_DIR in gdb, instead of STAGING_DIR.

 So, will you send a second patch that does exactly that [1] ?

 Regards,
 Arnout

[1]
https://git.buildroot.org/buildroot/tree/toolchain/helpers.mk?id=b3f033282bbada2e85625583fbcf56db0031d19e#n462


> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10386
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Ciro Santilli <ciro.santilli@gmail.com>
