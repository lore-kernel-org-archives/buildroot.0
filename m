From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu, 17 Sep 2015 19:21:57 +0200
Subject: [Buildroot] [2/2,
	v2] wpa_supplicant: Have Hotspot 2.0 depend on nl80211
In-Reply-To: <20150917153127.GA28715@t450s.lan>
References: <1437119950-25976-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150917153127.GA28715@t450s.lan>
Message-ID: <55FAF6B5.5080903@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/09/2015 17:31, Gary Bisson wrote:
> Hi Nicolas,
> 
> On Fri, Jul 17, 2015 at 09:59:10AM +0200, Nicolas Cavallari wrote:
>> Hotspot 2.0 uses ANQP whose implementation needs offchannel/
>> remain-on-channel capabilities from the driver, which only exist in the
>> nl80211 driver.  Compiling would work, but the feature would not work.
>>
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> ---
>>
>> v2: added signoff.
>>  package/wpa_supplicant/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
>> index 29dc4b9..22cf7f8 100644
>> --- a/package/wpa_supplicant/Config.in
>> +++ b/package/wpa_supplicant/Config.in
>> @@ -41,6 +41,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
>>  
>>  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
>>  	bool "Enable HS20"
>> +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
>>  	help
>>  	  Enable Hotspot 2.0 and IEEE 802.11u interworking functionality.
>>
> 
> First I'm not sure on the procedure to test the Hotspot 2.0 but I think
> we should at least add a comment like:
> 
> comment "HS20 needs NL80211 support"
> 	depends on !BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> 
> Because right now if you unselect NL80211 WPA option the HS20 just
> disappears.
> 
> Or maybe selecting NL80211 would be even better if absolutely required
> at runtime.


The more i think of it, the more I feel like the current behavior is
acceptable as is and this patch is unnecessary.

Sure, using a vanilla wpa_supplicant, the features needed by Hotspot 2.0
are only implemented by the nl80211 driver, but there may be other
non-vanilla drivers added by out-of-tree patches which also implement it.

These patches may be in a buildroot global patch directory.  We
shouldn't force nl80211 to be enabled to enable Hotspot 2.0 because this
is the only possibility that we know.
