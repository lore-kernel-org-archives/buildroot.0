From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 01:14:52 +0200
Subject: [Buildroot] Realtek-patched hostapd
In-Reply-To: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
References: <CADmjQgurGWOAgJW9bH4-zugv4C_Gz-satoLMJo-BxYToDGhj5g@mail.gmail.com>
 <877exab7yy.fsf@dell.be.48ers.dk>
 <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
Message-ID: <9a4237a9-a24b-4a1e-544f-f1c1218c4aaa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-17 13:19, Alexander Mukhin wrote:
> Hi Peter,
> 
> On 7 Sep 2017, at 22:54, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>>> "Alexander" == Alexander Mukhin <alexander.i.mukhin@gmail.com> writes:
>>
>>> Dear colleagues,
>>> let me ask for your advice.
>>
>>> I'll start with an overview.
>>
>>> Linux drivers for Realtek wireless chips do not fully implement the
>>> netlink interface. Because of that, hostapd cannot control them with
>>> its default netlink driver. There's a patch to hostapd, written
>>> originally by Realtek, which adds support for their chips. To build a
>>> patched hostapd in Buildroot, one can add the Realtek patch to the
>>> custom patches, and build the package in the usual way. This works
>>> fine, but the resulting binary will still include support for the
>>> netlink driver and will depend on the netlink library, which is
>>> superfluous in our circumstances.
>>
>> What a mess :/ I take it that this is for non-mainlined drivers?
> 
> Not exactly, the drivers are in the staging tree of the mainline kernel.
> 
> 
>>> To get rid of this dependency and build a specifically-targeted
>>> hostapd binary which supports Realtek chips only, I have to "clone"
>>> hostapd package and, by editing its Config.in and .mk files, drop
>>> netlink dependency.
>>
>>> The question is, should I contribute this Realtek-only version of the
>>> hostapd package, or dropping the netlink dependency is not a good
>>> reason for creating one more package?
>>
>> I would not like to have two hostapd packages in Buildroot.
>>
>> What is the plan going forward? Is this only a temporary issue and these
>> drivers are getting mainlined / extended or is it more of a permanent
>> issue? Are realtek actively maintaining this hostapd patch or do we risk
>> it getting bitrotten whenever we bump hostapd?
> 
> Realtek doesn't maintain neither the kernel drivers, nor the patch for hostapd. They occasionally release stand-alone drivers, but always stubbornly ignore the current Linux practice of using the netlink interface, relying instead on proprietary mechanisms. Also they once issued a patched hostapd, but didn't update it since. 

 My intuition is: people should simply refuse to use Realtek chips in their
designs and avoid this issue altogether. However, Buildroot is not about making
user's life difficult :-) So perhaps we should include a realtek-patched hostapd.

> 
> Keeping hostapd patch in sync with the current hostapd is the work done by an enthusiast (see https://github.com/pritambaral/hostapd-rtl871xdrv). As for now, he updates his patch in due time. This patch will be required as long as the kernel drivers do not support the netlink interface. And, in my opinion, it is unlikely that someone will add netlink support to the drivers in the nearest future. 

 As long as pritambaral does a good job keeping the patch up to date, could we
perhaps just patch the main hostapd package instead of having two packages?
Perhaps the patch should be made optional, to be sure we don't break things for
people who don't care about this Realtek crap.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
