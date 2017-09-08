From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Fri, 8 Sep 2017 14:19:03 +0300
Subject: [Buildroot] Realtek-patched hostapd
In-Reply-To: <877exab7yy.fsf@dell.be.48ers.dk>
References: <CADmjQgurGWOAgJW9bH4-zugv4C_Gz-satoLMJo-BxYToDGhj5g@mail.gmail.com>
 <877exab7yy.fsf@dell.be.48ers.dk>
Message-ID: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 7 Sep 2017, at 22:54, Peter Korsgaard <peter@korsgaard.com> wrote:

>>>>>> "Alexander" == Alexander Mukhin <alexander.i.mukhin@gmail.com> writes:
> 
>> Dear colleagues,
>> let me ask for your advice.
> 
>> I'll start with an overview.
> 
>> Linux drivers for Realtek wireless chips do not fully implement the
>> netlink interface. Because of that, hostapd cannot control them with
>> its default netlink driver. There's a patch to hostapd, written
>> originally by Realtek, which adds support for their chips. To build a
>> patched hostapd in Buildroot, one can add the Realtek patch to the
>> custom patches, and build the package in the usual way. This works
>> fine, but the resulting binary will still include support for the
>> netlink driver and will depend on the netlink library, which is
>> superfluous in our circumstances.
> 
> What a mess :/ I take it that this is for non-mainlined drivers?

Not exactly, the drivers are in the staging tree of the mainline kernel.


>> To get rid of this dependency and build a specifically-targeted
>> hostapd binary which supports Realtek chips only, I have to "clone"
>> hostapd package and, by editing its Config.in and .mk files, drop
>> netlink dependency.
> 
>> The question is, should I contribute this Realtek-only version of the
>> hostapd package, or dropping the netlink dependency is not a good
>> reason for creating one more package?
> 
> I would not like to have two hostapd packages in Buildroot.
> 
> What is the plan going forward? Is this only a temporary issue and these
> drivers are getting mainlined / extended or is it more of a permanent
> issue? Are realtek actively maintaining this hostapd patch or do we risk
> it getting bitrotten whenever we bump hostapd?

Realtek doesn't maintain neither the kernel drivers, nor the patch for hostapd. They occasionally release stand-alone drivers, but always stubbornly ignore the current Linux practice of using the netlink interface, relying instead on proprietary mechanisms. Also they once issued a patched hostapd, but didn't update it since. 

Keeping hostapd patch in sync with the current hostapd is the work done by an enthusiast (see https://github.com/pritambaral/hostapd-rtl871xdrv). As for now, he updates his patch in due time. This patch will be required as long as the kernel drivers do not support the netlink interface. And, in my opinion, it is unlikely that someone will add netlink support to the drivers in the nearest future. 


> -- 
> Bye, Peter Korsgaard

-- 
Best regards,
Alexander. 
