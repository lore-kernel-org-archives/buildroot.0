From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 11:13:24 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
In-Reply-To: <0707091002300.8319@somehost>
References: <20070709045947.D862330066@busybox.net>
	<0707091002300.8319@somehost>
Message-ID: <20070709091324.GB19774@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 09, 2007 at 10:18:21AM +0200, Cristian Ionescu-Idbohrn wrote:
>On Sun, 8 Jul 2007, ulf at uclibc.org wrote:
>
>> Author: ulf
>> Date: 2007-07-08 21:59:45 -0700 (Sun, 08 Jul 2007)
>> New Revision: 19051
>>
>> Log:
>> WGET_NOSPIDERS is not defined, use WGET for now
>>
>> Modified:
>>    trunk/buildroot/package/hostap/hostap.mk
>>
>>
>> Changeset:
>> Modified: trunk/buildroot/package/hostap/hostap.mk
>> ===================================================================
>> --- trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:40:53 UTC (rev 19050)
>> +++ trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:59:45 UTC (rev 19051)
>> @@ -9,7 +9,7 @@
>>  HOSTAP_DIR=$(BUILD_DIR)/hostapd-$(HOSTAP_VERSION)
>>
>>  $(DL_DIR)/$(HOSTAP_SOURCE):
>> -	$(WGET_NOSPIDERS) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)
>> +	$(WGET) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)
>>
>>  hostap-source: $(DL_DIR)/$(HOSTAP_SOURCE)
>
>Alright.  The problem here is that the wget '--spider' option does just
>what the man-page says:
>
>  --spider
>      When invoked with this option, Wget will behave as a Web spider,
>      which means that it will not download the pages, just check that
>      they are there.
>
>and hostap.epitest.fi replies accordingly, saying the file is there and
>shows its size too.
>
>  # make hostap-source
>  wget --passive-ftp -nd --spider -P /data/cii/buildroot/buildroot/dl
>  http://hostap.epitest.fi/releases/hostapd-0.5.8.tar.gz
>  --09:59:41--  http://hostap.epitest.fi/releases/hostapd-0.5.8.tar.gz
>             => `/data/cii/buildroot/buildroot/dl/hostapd-0.5.8.tar.gz'
>  Resolving hostap.epitest.fi... 204.152.186.63
>  Connecting to hostap.epitest.fi|204.152.186.63|:80... connected.
>  HTTP request sent, awaiting response... 200 OK
>  Length: 459,253 (448K) [application/x-tar]
>  200 OK
>
>Nothing is downloaded.  Patch attached.

No. Fix your BR2_WGET instead:
BR2_WGET="wget --passive-ftp"

PS: sounds a bit like you did a source-check and forgot to reinstate
your sane config afterwards.
