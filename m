From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 23:06:03 +0200
Subject: [Buildroot] [PATCH] package/hostapd: add upstream patch to fix
 CVE-2021-27803
In-Reply-To: <20210601200043.GA168928@scaer>
References: <20210601180915.14897-1-sam.voss@collins.com>
 <20210601200043.GA168928@scaer>
Message-ID: <11b326bb-8425-7615-f4bc-ce380dcadbf8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2021 22:00, Yann E. MORIN wrote:
> Sam, All,
> 
> On 2021-06-01 13:09 -0500, Sam Voss via buildroot spake thusly:
>> Fixes the following:
>>
>> - CVE-2021-27803: A vulnerability was discovered in how p2p/p2p_pd.c in
>> wpa_supplicant before 2.10 processes P2P (Wi-Fi Direct) provision
>> discovery requests. It could result in denial of service or other impact
>> (potentially execution of arbitrary code), for an attacker within radio
>> range.
> 
> Usually, when there is a patch to hostpad to fix a CVE, we probably need
> the same patch against wpa_supplicant, since they both shared the same
> source tree...
> 
> See for example:
> 
>     0c65499c3f package/wpa_supplicant: fix build with CVE-2021-30004 changes
>     75496165dc package/hostapd: fix build with CVE-2021-30004 changes
>     a8fbe67b9b package/wpa_supplicant: add upstream patch to fix CVE-2021-30004
>     d65586f45a package/hostapd: add upstream patch to fix CVE-2021-30004
>     2f6a6b8e50 package/wpa_supplicant: ignore CVE-2021-30004 when using openssl
>     3d3348fd03 package/hostapd: ignore CVE-2021-30004 when using openssl
>     650d907c13 package/wpa_supplicant: fix CVE-2019-16275
>     749fbab0bb package/hostapd: fix CVE-2019-16275
> 
> Could you look at providing a patch to wpa_supplicant for
> CVE-2021-27803, please?

 Peter already applied it in 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647, at the
time there was no CVE yet. Fabrice later added the exception for CVE-2021-27803
in 1a7cf592a834357c5777e452f0b7ab7652e7d389.

 So Sam, nothing to do :-)

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Sam Voss <sam.voss@collins.com>
>> ---
>>  package/hostapd/hostapd.hash | 1 +
>>  package/hostapd/hostapd.mk   | 6 +++++-
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
>> index e2f76c12d9..9ac5f4b392 100644
>> --- a/package/hostapd/hostapd.hash
>> +++ b/package/hostapd/hostapd.hash
>> @@ -3,4 +3,5 @@ sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostap
>>  sha256  2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7  0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
>>  sha256  49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de  0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
>>  sha256  a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a  0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
>> +sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
>>  sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
>> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
>> index 8eff92eb1e..8820254f89 100644
>> --- a/package/hostapd/hostapd.mk
>> +++ b/package/hostapd/hostapd.mk
>> @@ -11,7 +11,8 @@ HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
>>  HOSTAPD_PATCH = \
>>  	https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
>>  	https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
>> -	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
>> +	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
>> +	https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
>>  HOSTAPD_DEPENDENCIES = host-pkgconf
>>  HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
>>  HOSTAPD_LICENSE = BSD-3-Clause
>> @@ -26,6 +27,9 @@ HOSTAPD_IGNORE_CVES += CVE-2020-12695
>>  # 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
>>  HOSTAPD_IGNORE_CVES += CVE-2021-30004
>>  
>> +# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
>> +HOSTAPD_IGNORE_CVES += CVE-2021-27803
>> +
>>  HOSTAPD_CPE_ID_VENDOR = w1.fi
>>  HOSTAPD_CONFIG_SET =
>>  
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
