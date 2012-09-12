From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 18:19:01 +0200
Subject: [Buildroot] big root fs
In-Reply-To: <20120912102727.46894561@skate>
References: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120911154439.47e2b53a@skate>
 <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120912084434.13946c09@skate>
 <1347438063.92384.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120912102727.46894561@skate>
Message-ID: <5050B5F5.6080305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 10:27, Thomas Petazzoni wrote:
> Le Wed, 12 Sep 2012 01:21:03 -0700 (PDT),
> Zoran Djordjevic<djdjdjole@yahoo.com>  a ?crit :
>
>> It is hard to send output/target folder, because it is about 100MB uncompressed.
>> Maybe someone will have suggestion, according to next size info:
>> The biggest folder inside "target" is /lib(20MB) and  /usr - 86MB (/usr/lib -20MB ; /usr/share - 60).
>> Inside /usr/share - the most parts go to folders: locale (35MB);
  The large /lib is indicative of a linux kernel config with too many modules.
Probably because you use a defconfig.  Do:
  make linux-menuconfig
and get rid of the modules you don't need.
Then, change your buildroot configuration to use a custom config instead of
a defconfig, and do
  make linux-update-defconfig
to save the custom config.

  Don't forget to wipe output/target/lib/modules before rebuilding,
or the old modules will just stay there...

> Enable option BR2_ENABLE_LOCALE_PURGE. And you can probably set
> BR2_ENABLE_LOCALE_WHITELIST to just "C en_US". This should get rid of
> most of your usr/share/locale directory.
>
> I'm wondering whether we should make BR2_ENABLE_LOCALE_PURGE=y and
> BR2_ENABLE_LOCALE_WHITELIST="C en_US" the defaults.

  Yes!

>> fonts(20MB) and X11(5MB).
  fonts seems a bit on the large side.  Check which font packages you have
selected.
>> I can send some of them although I am aware that info I provided is not so clear.
> Can you send the output of:
>
> 	cd output/target/
> 	ls -lRS
  Make that ls -lRSh (so we get size in MB instead of bytes).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
