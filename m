From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Fri, 9 Jul 2010 12:00:48 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
	<201007071919.28956.yann.morin.1998__5616.15332630954$1278523238$gmane$org@anciens.enib.fr>
Message-ID: <BLU0-SMTP635B56CA30CCF7399EC9D7E7B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, July 07, 2010 7:19 PM, Yann E. MORIN wrote:

> Well, I'd rather we had something like:
> - in menuconfig:
>    () Additional dirs to copy from sysroot
>      Help:
>        This is a space-separated list of paths that you want to copy
>        from the sysroot to the target. Make the paths relative to the
>        sysroot. Example:
>          /usr/lib/gconv /usr/include
>
> - and in ext-tool.mk (to replace your changes, above):
>  $(Q)for d in $(BR_EXT_TOOL_DIRS_EXTRA); do \
>        if [ -d "$(ARCH_SYSROOT_DIR)$${d}" ]; then
>          mkdir -p "$(TARGET_DIR)$${d}"
>          cp -a "$${d}/." "$(TARGET_DIR)${d}/."
>        else
>          echo "No such directory '$${d}' whiel trying to copy from 
> sysroot"
>        fi
>      done
>
> But that's just my 2-cent advice...
>

You know the more I think about it, the more I like this sort of approach. 
I understand Thomas' view that dependencies should be automatic as much as 
possible, but the more I look into it, the more I think that buildroot could 
also benefit from some "advanced" setting to allow additional files and 
folders to be copied across.

Beyond the 'gconv' folder mentioned in this thread, there are other 
libraries, binaries and miscellaneous text files that could (should in my 
case) also be copied across from the sys-root folder depending on the target 
system's requirements.

I've attached to this post a snippet of bash script that I now run prior to 
the buildroot process to copy across the missing files and folders that 
buildroot doesn't itself copy.  There is some duplication - for example, the 
script copies /lib/libnss_*.so* since buildroot only copies two of these 
files, and not the libnss_compat.so that my system needs.

Maybe this can form the basis of an "advanced" copy function inside 
buildroot?  The files list would then obviously be changed to a 
configuration variable for the user, rather than a static list.  To my mind, 
it makes sense to do this since buildroot cannot necessarily know or detect 
all the necessary dependencies, and what may be dependencies in one case may 
not be in the general case, and it certainly doesn't make sense to do a 
blanket copy of the whole sys-root directory.

If there is interest in this, and it seems an appropriate route to take, 
I'll happily put together a proposal patch...

Cheers
Andy

-------------- next part --------------
A non-text attachment was scrubbed...
Name: copy
Type: application/octet-stream
Size: 1317 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100709/07e8e775/attachment.obj>
