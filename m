From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 27 Apr 2015 11:24:11 -0400 (EDT)
Subject: [Buildroot] Any ideas about mechanism of updating
 software/firmware?
In-Reply-To: <553DD8C9.1040602@gmail.com>
References: <553DD8C9.1040602@gmail.com>
Message-ID: <493144149.114608.1430148251538.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xuebing,

> Is it a good practice to update 'system/skeleton/etc/issue' when a new
> version will be 'git tag'ed and built?

No, you shouldn't modify Buildroot's default files. All project-specific files 
should go in a new directory under board/, typically 
board/<customer>/<project>/.  You can define a directory from which all files
will be copied as is to the rootfs.  For instance, try the following config:

    BR2_ROOTFS_OVERLAY="board/<customer>/<project>/fs-overlay"

with a custom file board/<customer>/<project>/fs-overlay/etc/issue.

Note that if you want a dynamic value such as the git tag, you can use a 
post-build script writing to ${TARGET_DIR}/etc/issue (see 
BR2_ROOTFS_POST_BUILD_SCRIPT). 

(Also note that /etc/os-release already contains the full version string).

Regards,
-v
