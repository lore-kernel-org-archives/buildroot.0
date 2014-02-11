From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Feb 2014 19:01:23 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140211101015.1b282bd3@skate>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate>
Message-ID: <20140211180123.GB3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-11 10:10 +0100, Thomas Petazzoni spake thusly:
> On Tue, 11 Feb 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:
[--SNIP--]
> >      avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/7bf7f9c786a3199e29d0dc38c4878cb6bf9c26dc/
> 
> ../libdwfl/libdwfl_pic.a(find-debuginfo.os): In function `find_debuginfo_in_path':
> find-debuginfo.c:(.text+0x3e6): undefined reference to `canonicalize_file_name'
> ../libdwfl/libdwfl_pic.a(dwfl_build_id_find_elf.os): In function `__libdwfl_open_by_build_id':
> dwfl_build_id_find_elf.c:(.text+0x1a8): undefined reference to `canonicalize_file_name'

I already looked at that one: the toolchain is using uClibc 0.9.31, and
canonicalize_file_name is missing in that version (it only appeared in
0.9.32, IIRC).

> >        arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/
> 
> libusb compatibility issue?
> 
> scan_usb.c:34:29: error: unknown type name 'usb_dev_handle'
> scan_usb.c:38:41: error: unknown type name 'usb_dev_handle'
> scan_usb.c:41:1: error: unknown type name 'usb_dev_handle'
> scan_usb.c:41:48: warning: 'struct usb_device' declared inside parameter list [enabled by default]
> scan_usb.c:41:48: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> scan_usb.c: In function 'nutscan_load_usb_library':
> scan_usb.c:67:22: error: 'nut_usb_close' undeclared (first use in this function)

I tried to reproduce it here, but it builds fine (in a squeeze-32
chroot, with almost nothing installed except the Buildroot
dependencies).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
