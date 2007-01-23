From: Claus Klein <claus.klein@arcormail.de>
Date: Tue, 23 Jan 2007 23:20:34 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <20070122203049.GC4981@aon.at>
References: <200701191331.07579.thilo@riessner.de>
	<20070122200253.GB4981@aon.at> <20070122203049.GC4981@aon.at>
Message-ID: <200701232320.34740.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 22 January 2007 21:30, Bernhard Fischer wrote:
> On Mon, Jan 22, 2007 at 09:02:53PM +0100, Bernhard Fischer wrote:
> >On Mon, Jan 22, 2007 at 07:16:35PM +0100, Thilo Riessner wrote:
> >>Am Freitag, 19. Januar 2007 17:33 schrieben Sie:
> >>> On Fri, Jan 19, 2007 at 04:12:09PM +0100, Thilo Riessner wrote:
> >>> >Am Freitag, 19. Januar 2007 14:35 schrieb Goetz Bock:
> >>> >> On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
> >>> >> > In the docs is mentioned, that one doesn't need to be root to build a
> >>> >> > root filesystem. But when building the filesystem as a normal user,
> >>> >> > chown is not able to change owner to root in the target filesystem. Is
> >>> >> > there a solution of the problem, that I don't see?
> >>>
> >>> Who does call chown in there? Which package?
> >>> Please show me the logs around the alleged call to chown that is
> >>> failing.
> 
> I've updated fakeroot, both the old version and the new one work for me.
> Please update, make dirclean && make and let me know if you still get
> this error..

it works, but there are still the error messges?
claus at P3linux:~/src/buildroot> make
...

chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/readline/GPL2.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/readline': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/dhcp.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/commoncpp2/LGPL.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/commoncpp2': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/iputils/GPL2.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/iputils': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/portmap/RofUCA.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/portmap': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/busybox/GPL2.txt': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses/busybox': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root/licenses': Operation not permitted
chown: changing ownership of `/home/claus/src/buildroot/build_i686/root': Operation not permitted
rootdir=/home/claus/src/buildroot/build_i686/root
table='target/generic/device_table.txt'
claus at P3linux:~/src/buildroot> !tar
tar tvf rootfs.i686.tar | tail
lrwxrwxrwx root/root         0 2007-01-23 23:10:15 ./licenses/readline/GPL2.txt -> ../GPL2.txt
-rw-r--r-- root/root      5128 2004-06-18 13:59:35 ./licenses/dhcp.txt
drwxr-xr-x root/root         0 2004-05-14 14:37:32 ./licenses/commoncpp2/
lrwxrwxrwx root/root         0 2007-01-23 23:10:15 ./licenses/commoncpp2/LGPL.txt -> ../LGPL.txt
drwxr-xr-x root/root         0 2004-05-14 14:37:32 ./licenses/iputils/
lrwxrwxrwx root/root         0 2007-01-23 23:10:15 ./licenses/iputils/GPL2.txt -> ../GPL2.txt
drwxr-xr-x root/root         0 2004-07-05 17:18:32 ./licenses/portmap/
lrwxrwxrwx root/root         0 2007-01-23 23:10:15 ./licenses/portmap/RofUCA.txt -> ../RofUCA.txt
drwxr-xr-x root/root         0 2004-05-14 14:37:32 ./licenses/busybox/
lrwxrwxrwx root/root         0 2007-01-23 23:10:15 ./licenses/busybox/GPL2.txt -> ../GPL2.txt
claus at P3linux:~/src/buildroot>              

claus at P3linux:~/src/buildroot> make -n tarroot
find /home/claus/src/buildroot/build_i686/root -type f -perm +111 | xargs /tools/Linuxi386CDK/bin/i686-linux-uclibc-strip --remove-section=.comment --remove-section=.note 2>/dev/null || true;
rm -rf /home/claus/src/buildroot/build_i686/root/usr/man
rm -rf /home/claus/src/buildroot/build_i686/root/usr/info
/sbin/ldconfig -r /home/claus/src/buildroot/build_i686/root 2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
touch /tools/Linuxi386CDK/.fakeroot.00000
cat /tools/Linuxi386CDK/.fakeroot* > /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
echo "chown -R root:root /home/claus/src/buildroot/build_i686/root" >> /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
# Use fakeroot to pretend to create all needed device nodes
echo "/tools/Linuxi386CDK/bin/makedevs -d target/generic/device_table.txt /home/claus/src/buildroot/build_i686/root" \
                >> /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
# Use fakeroot so tar believes the previous fakery
echo "tar -c""f /home/claus/src/buildroot/rootfs.i686.tar -C /home/claus/src/buildroot/build_i686/root ." \
                >> /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
chmod a+x /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
/tools/Linuxi386CDK/usr/bin/fakeroot -- /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar
rm -f /tools/Linuxi386CDK/_fakeroot.rootfs.i686.tar

claus at P3linux:~/src/buildroot> /tools/Linuxi386CDK/usr/bin/fakeroot -v
fakeroot version 1.5.12

claus at P3linux:~/src/buildroot> file /tools/Linuxi386CDK/.fakeroot.00000
/tools/Linuxi386CDK/.fakeroot.00000: empty
claus at P3linux:~/src/buildroot>      

What is this file for and why is it still empty?

Bye
Claus
