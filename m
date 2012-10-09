From: Chris Westervelt <chris.westervelt@advantor.com>
Date: Tue, 9 Oct 2012 10:08:34 -0500
Subject: [Buildroot] Adding my applications to the image generated
In-Reply-To: <k51cpp$cnh$2@ger.gmane.org>
References: <C008AB77AF9902469191C92183A1C6128B56E20A40@AUSP01VMBX13.collaborationhost.net>
 <k51cpp$cnh$2@ger.gmane.org>
Message-ID: <C008AB77AF9902469191C92183A1C6128B56E20A9B@AUSP01VMBX13.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Grant Edwards
Sent: Tuesday, October 09, 2012 10:37 AM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] Adding my applications to the image generated

On 2012-10-09, Chris Westervelt <chris.westervelt@advantor.com> wrote:

> I'm new to build root but a long time LTIB user.  In LTIB, we had a 
> way to 'merge' our custom files to the final build by putting them in 
> a merge directory that replicated the directory hierarchy with the 
> files in each level of the tree.  Is there a way to do this in 
> Buildroot?

There are several ways to do it:

http://buildroot.uclibc.org/downloads/manual/manual.html#_customizing_the_generated_target_filesystem

Using the "customize" package is depricated, and I think will be eliminated in the near future.  It sounds to me like you probably want to define a post-build script that merges your custom files files into the target tree after it's been built.

I've placed a tree of files to be merged in "../custom-files" and the post-build script copies them into the target directory.  My post-build script shown below.  The line the does the merging of my custom files is the 'tar' command.  The rest of the script tweaks some of the pre-existing files.

Once you've written a post-build script, you need to set the the BR2_ROOTFS_POST_BUILD_SCRIPT configuration variable to point to it:

In my .config file:

BR2_ROOTFS_POST_BUILD_SCRIPT="../postbuild.sh"



------------------------------postbuild.sh------------------------------
#/bin/bash

echo ">>>   Post-build script start"
TARGET="$1"
set -x

# modify snmpd init script so that it listens on all interfaces rather # than only on 127.0.0.1 sed -i '/^SNMPDOPTS/ s/ *127\.0\.0\.1//g' $TARGET/etc/init.d/S*snmpd

# copy custom-files
tar -c -f - -C ../custom-files --exclude-vcs --exclude-backup . | \
          tar -v -x -f - -C "$TARGET"

# set some global env variables by exporting them in rcS
sed -i -e '/^export PATH=/ d'                    $TARGET/etc/init.d/rcS
sed -i -e '/^export LD_LIBRARY_PATH=/ d'         $TARGET/etc/init.d/rcS
sed -i -e '2 iexport PATH=$PATH:/apps/bin'       $TARGET/etc/init.d/rcS
sed -i -e '2 iexport LD_LIBRARY_PATH=/apps/lib'  $TARGET/etc/init.d/rcS

# tweak PHP settings
sed -i -e 's/^upload_max_filesize.*/upload_max_filesize = 10M/g' $TARGET/etc/php.ini

# make sure ssh keys aren't readable by anybody except owner chmod go-rwx $TARGET/etc/ssh_*_key

set +x
echo ">>>   Post-build script done"
------------------------------------------------------------------------


-- 
Grant Edwards               grant.b.edwards        Yow! I want a VEGETARIAN
                                  at               BURRITO to go ... with
                              gmail.com            EXTRA MSG!!

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
