From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 10 Jun 2014 11:38:50 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
Message-ID: <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cem,

On Tue, Jun 10, 2014 at 11:23 AM, cem akpolat <akpolatcem@gmail.com> wrote:
> Dear all,
>
> I am attempting right now to copy some files through Root overlay to my file
> system image, however, as some of them requires root permission I cannot
> copy them to the related place. For instance, openvpn files such as
> server.key, ta.keys, etc raise the following issue:
>
> cp: cannot access
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/easy-rsa/2.0/keys':
> Permission denied
> cp: cannot access
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/easy-rsa/2.0/keys':
> Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/server.conf'
> for reading: Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/server.key'
> for reading: Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/samples/client.conf'
> for reading: Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/ta.key'
> for reading: Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/server.key'
> for reading: Permission denied
> cp: cannot open
> '/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/samples/client.conf'
> for reading: Permission denied
>
> The script that I have written in post-build.sh as below:
>
> fakeroot cp -r $BOARD_DIR/root-additions/etc/openvpn $TARGET_DIR/etc/
> fakeroot cp -r $BOARD_DIR/root-additions/etc/snmp $TARGET_DIR/etc/

Here is how I would handle such a use-case:
1- make sure the source files can be accessed (i.e. you can read
everything in $BOARD_DIR/root-additions/etc/{openvpn,snmp})
2- create dummy package containing the install rules of these files
(you can also move these files under this package directory)
3- use the _PERMISSION infra, as explained at [1].

(I have not tested this myself)

Hope this help.
Regards,


[1] http://nightly.buildroot.org/manual.html#_the_literal_mk_literal_file

-- 
Samuel
