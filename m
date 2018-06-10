From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Jun 2018 23:46:59 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
Message-ID: <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-06-18 13:38, Carlos Santos wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
>> Sent: Thursday, June 7, 2018 6:12:48 PM
>> Subject: Re: [Buildroot] swapoff, but no swapon in initab
> 
>> On 06-06-18 19:14, Carlos Santos wrote:
>>> Hi,
>>>
>>> I'm working on a product that needs a swap partition and noticed that
>>> both package/{busybox,sysvinit}/inittab invoke "swapoff -a" in their
>>> shutdown sequences but do not invoke "swapon -a". Is this intentional
>>> or the swapon call is missing (e.g. right after "mount -a")?
>>
>> It has been like that since
>>
>> commit ffde94bd2ca21542ae0b4518348f8e986b9d92e0 (tag: 0_0)
>> Author: Eric Andersen <andersen@codepoet.org>
>> Date:   Sat Dec 22 01:56:11 2001
>>
>>    Initial revision
>>
>> so whatever reason there was, it is lost in the mists of time.
>>
>> IMO I think it's pointless (the kernel will freeze swap accesses before
>> shutdown) and possibly wrong (swap to file should be disabled before the
>> corresponding filesystem is unmounted).
>>
>>
>> Anyway, the proper way to handle swap is by adding it to fstab, no? I just
>> checked and busybox seems to support it.
> 
> The point here is that I'd like to avoid adding yet another init script
> just to call swap{on,off} in its st{art,op} phase. A "swapon -a" in
> inittab would inspect /etc/fstab, as stated in the man page:

 Ah, yes, I thought mount -a would do that.

> 
>   "All devices marked as ``swap'' in /etc/fstab are made available,
>    except for those with the ``noauto'' option. Devices that are
>    already being used as swap are silently skipped."

 So bottom line: it would make sense to add a swapon -a to the default inittabs
(both busybox and sysv).

 For system, BTW, I would expect it would already do the right thing based on
fstab, no?

 Regards,
 Arnout

> 
> So even if the system already has such init script (e.g. from a
> rootfs ovelay) a second call would be harmless.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
