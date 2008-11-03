From: yongyew <yongyew@actatek.com>
Date: Mon, 03 Nov 2008 21:29:08 +0800
Subject: [Buildroot] sendto: Invalid argument
In-Reply-To: <87fxmaxdml.fsf@macbook.be.48ers.dk>
References: <4909C462.2080307@actatek.com> <87fxmaxdml.fsf@macbook.be.48ers.dk>
Message-ID: <490EFCA4.5020908@actatek.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

thank for reply :)  I have found the problem.  I using the custom kernel 
2.6.13 but the kernel header is different from the standard kernel header.

my custom kernel which not using _NR_xxx . current solution is to 
manually point BR2 to custom kernel header which force uclibc to use 
__NR_socketcall.  Now have another problem is to make BR2 to support 
custom kernel without kernel header.


include/asm-arm/unistd.h
===============================================================================
#if 0 /* reserve these for un-muxing socketcall */
#define __NR_socket                     (__NR_SYSCALL_BASE+281)
#define __NR_bind                       (__NR_SYSCALL_BASE+282)
#define __NR_connect                    (__NR_SYSCALL_BASE+283)
#define __NR_listen                     (__NR_SYSCALL_BASE+284)
#define __NR_accept                     (__NR_SYSCALL_BASE+285)
#define __NR_getsockname                (__NR_SYSCALL_BASE+286)
#define __NR_getpeername                (__NR_SYSCALL_BASE+287)
#define __NR_socketpair                 (__NR_SYSCALL_BASE+288)
#define __NR_send                       (__NR_SYSCALL_BASE+289)
#define __NR_sendto                     (__NR_SYSCALL_BASE+290)
#define __NR_recv                       (__NR_SYSCALL_BASE+291)
#define __NR_recvfrom                   (__NR_SYSCALL_BASE+292)
#define __NR_shutdown                   (__NR_SYSCALL_BASE+293)
#define __NR_setsockopt                 (__NR_SYSCALL_BASE+294)
#define __NR_getsockopt                 (__NR_SYSCALL_BASE+295)
#define __NR_sendmsg                    (__NR_SYSCALL_BASE+296)
#define __NR_recvmsg                    (__NR_SYSCALL_BASE+297)
#endif
=======================================================================



Peter Korsgaard wrote:
>>>>>> "yongyew" == yongyew  <yongyew@actatek.com> writes:
>>>>>>             
>
>  yongyew> Dear all,
>  yongyew> I face same problem when i do the following ping
>
>  yongyew> PING 127.0.0.1 (127.0.0.1): 56 data bytes
>  yongyew> ping: sendto: Invalid argument
>
>  yongyew> My eth0 is already config with eth0 and lo using ifconfig.
>  yongyew> Do anyone have any idea what is the cause. 
>
> Not without more details about your setup.
>
>   


-- 
Cheong Yong Yew
Software Project Manager

ACTAtek Pte Ltd/Hectrix Ltd
18, Boon Lay Way, #09-96/97/98
TradeHub 21, Singapore 609964
Tel  :    (65) 65154520
Fax :    (65) 65154521
Skype :  co-yongyew
E-mail :  yongyew at actatek.com
website : www.actatek.com
 
Secure Access Control/Time Attendance & Advertising/Information Systems
 
----------------------------------------------------------------------------
New Company Achievement Award:

August 5, 2008 - ACTAtek Pte Ltd is pleased to know that Network Products
Guide a Silicon Valley Communications publication and a world leading
publication on technologies and solutions has named ACTAtek2, a winner of
the 2008 Best Products and Services Award (Best in Integrated Security
Appliance)

-----------------------------------------------------------------
Please visit our booth:

Security Sydney 2008 Conference & Exhibition
Date: 26-28 August 2008
Venue: Sydney Convention & Exhibition Centre Australia
            Darling Harbour, Hall 5
Booth: G42
Website:  www.securityexpo.com.au

ASIS INTERNATIONAL, Atlanta 2008
54th Annual Seminar & Exhibits
Date: September 15-17, 2008
Venue: Georgia World Congress Center
            285 Andrew Young International Blvd., NW
            Atlanta, GA USA
Booth: 219
Website: http://www.asisonline.org/asis2008

 
-----------------------------------------------------------------------------------------
This message and any attachment are confidential and may be privileged or otherwise
protected from disclosure. If you are not the intended recipient please telephone or e-mail
the sender and delete this message and all attachments from your system.If you are not
the intended recipient you must not copy this message

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081103/474314d7/attachment.htm 
