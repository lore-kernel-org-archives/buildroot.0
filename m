From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Feb 2015 22:39:41 +0100
Subject: [Buildroot] [PATCH 2/2] fs: add custom fakeroot script support
In-Reply-To: <1424792855-14278-2-git-send-email-stefan.sorensen@spectralink.com>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
 <1424792855-14278-2-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150224213941.GB4783@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2015-02-24 16:47 +0100, Stefan S?rensen spake thusly:
> This patch add a new config option, BR2_ROOTFS_FAKEROOT_SCRIPT, a list of
> scripts that are executed in the fakeroot environment as the last step
> before creating the filesystem image.

I'm not specially opposed to that feature (and in fact I think this
would be nice to have!), but parts of the justification are not
completely right, see below...

> The scripts can for example be used to invoke a tool that operates on
> file ownerships,

For file ownership, we already have BR2_ROOTFS_DEVICE_TABLE: "Path to
the permission tables". The naming of the option may be a bit
misleading, indeed, but that's historical...

> device nodes

Ditto, we also already have BR2_ROOTFS_STATIC_DEVICE_TABLE: "Path to the
device tables". That can indeed only be used when using static /dev
management, but when /dev is managed dynamically (devtmpfs, eudev, mdev
or systemd), having custom device tables is completely useless (as /dev
is a mountpoint, and existing /dev entries would become invisible).

> or any other custom action that requires
> root privileges.

What would be those kind of "custom actions" that are not covered by the
above?

One thing I can see as problematic is assigning ownership to a whole
directory tree, of which the content might be unpredictable at configure
time (e.g. so that it is not possible to provide a permission table for
all the entries); something one might trivially do (with your solution):

    #!/bin/sh
    TARGET_DIR="${1}"
    chown -R uid:gid ${TARGET_DIR}/foo/bar/

But even with what we currently have, this is already doable (albeit
this is a bit of a hack). One would set:

    BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt $(BUILD_DIR)/tmp-perms"
    BR2_ROOTFS_POST_BUILD_SCRIPT="/path/to/post-build.script"
    BR2_ROOTFS_POST_SCRIPT_ARGS"$(BUILD_DIR)"

and then have /path/to/post-build.script contain something like:

    #!/bin/sh
    TARGET_DIR="${1}"
    BUILD_DIR="${2}"
    uid=42
    gid=31415
    find ${TARGET_DIR}/foo/bar/ \( -type f -o -type d \) \
    |while read entry; do
        [ -f "${entry}" ] && t=f
        [ -d "${entry}" ] && t=d
        m="$( stat -c '%a' "${entry}" )"
        m=$((m&0760)) # Whatever...
        printf "%s %s %s %s %s - - - - -\n" \
              "${entry#${TARGET_DIR}}" ${t} ${m} ${uid} ${gid}
    done >"${BUILD_DIR}/tmp-perms"

Granted, that's neither trivial nor elegant, but that's doable.

[--SNIP--]
> diff --git a/system/Config.in b/system/Config.in
> index 95e10ab..b416377 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -421,6 +421,22 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
>  	  argument. Make sure the exit code of those scripts are 0, otherwise
>  	  make will stop after calling them.
>  
> +config BR2_ROOTFS_FAKEROOT_SCRIPT
> +	string "Custom scripts to run as fake root"

I'm not very happy with talking about 'fake root' (which is really
'fakeroot'). I'd prefer we avoid mentionning fakeroot, which is
internal implementation details.

Note also that those scripts would be run once for each filesystem type
the user has enabled; if tar, squashfs, cramfs and ext2/3/4 are enabled,
the scripts would be run four times. Thus, those scripts must be
idempotent (like for the post-build scripts, mind you).

In the end (and after quite some thinking!), I stil fail to see a
compelling reason. Do you have an example?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
