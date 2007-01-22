From: Thilo Riessner <thilo@riessner.de>
Date: Mon, 22 Jan 2007 19:16:35 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <20070119163313.GA17320@aon.at>
References: <200701191331.07579.thilo@riessner.de>
	<200701191612.12016.thilo@riessner.de>
	<20070119163313.GA17320@aon.at>
Message-ID: <200701221916.36228.thilo@riessner.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag, 19. Januar 2007 17:33 schrieben Sie:
> On Fri, Jan 19, 2007 at 04:12:09PM +0100, Thilo Riessner wrote:
> >Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
> >> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
> >> > In the docs is mentioned, that one doesn't need to be root to build a
> >> > root filesystem. But when building the filesystem as a normal user,
> >> > chown is not able to change owner to root in the target filesystem. Is
> >> > there a solution of the problem, that I don't see?
>
> Who does call chown in there? Which package?
> Please show me the logs around the alleged call to chown that is
> failing.
# Use fakeroot to pretend all target binaries are owned by root
rm -f /home/foo/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
touch /home/foo/buildroot/build_i386/staging_dir/.fakeroot.00000
cat /home/foo/buildroot/build_i386/staging_dir/.fakeroot* 
> /home/triessner/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
echo "chown -R root:root /home/foo/buildroot/build_i386/root" 
>> /home/triessner/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
# Use fakeroot to pretend to create all needed device nodes
echo "/home/foo/buildroot/build_i386/staging_dir/bin/makedevs -d 
target/generic/device_table.txt /home/triessner/buildroot/build_i386/root" \
                
>> /home/foo/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
# Use fakeroot so genext2fs believes the previous fakery
GENEXT2_REALSIZE=`LC_ALL=C 
du -l -s -c -k /home/foo/buildroot/build_i386/root | grep total | 
sed -e "s/total//"`; \
        GENEXT2_ADDTOROOTSIZE=`if [ $GENEXT2_REALSIZE -ge 20000 ] ; then echo 
16384; else echo 2400; fi`; \
        GENEXT2_SIZE=`expr $GENEXT2_REALSIZE + $GENEXT2_ADDTOROOTSIZE`; \
        GENEXT2_ADDTOINODESIZE=`find /home/foo/buildroot/build_i386/root | 
wc -l`; \
        GENEXT2_INODES=`expr $GENEXT2_ADDTOINODESIZE + 400`; \
        set -x; \
        echo "/home/foo/buildroot/build_i386/genext2fs-1.3/genext2fs -b 
$GENEXT2_SIZE " \
                "-i $GENEXT2_INODES -d /home/foo/buildroot/build_i386/root " \
                " -r 0 /home/foo/buildroot/rootfs.i386.ext2" 
>> /home/triessner/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
+ echo '/home/foo/buildroot/build_i386/genext2fs-1.3/genext2fs -b 4548 ' '-i 
761 -d /home/triessner/buildroot/build_i386/root ' ' -r 
0 /home/triessner/buildroot/rootfs.i386.ext2'
chmod 
a+x /home/foo/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
/home/foo/buildroot/build_i386/staging_dir/usr/bin/fakeroot -- /home/triessner/buildroot/build_i386/staging_dir/_fakeroot.rootfs.i386.ext2
chown: ?ndern des Eigent?mers von 
?/home/foo/buildroot/build_i386/root/bin/busybox?: Die Operation ist nicht 
erlaubt
