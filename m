From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 09:22:06 +0200
Subject: [Buildroot] [PATCH 2/2] board: amarula: a64-relic: Add WiFi
 support
In-Reply-To: <20180531085744.218e2e2c@windsurf.home>
References: <20180528171227.8352-1-jagan@amarulasolutions.com>
 <20180528171227.8352-2-jagan@amarulasolutions.com>
 <c7d8ca34-02ae-125e-1d2c-862ad221ccd9@mind.be>
 <20180531085744.218e2e2c@windsurf.home>
Message-ID: <3c0ebffd-f331-6c0e-0848-e0fe66129ef6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-05-18 08:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 30 May 2018 23:40:59 +0200, Arnout Vandecappelle wrote:
> 
>>> + # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
>>> +   (type password and enter)
>>> + # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
>>> + # udhcpc -i wlan0

 I notice now that it was just copied from warp7 :-)

>>
>>  Could we add the latter two to an init script instead? Should be S40 so it
>> coincides with S40network from ifupdown-scripts.
>>
>>  So in the readme, these two lines would then be replaced with
>>
>> # /etc/init.d/S40wlan start
> 
> I'm not sure how that would work. You first need to enter the
> passphrase for the WiFi chip to associate with the AP, and therefore
> before doing the udhcp.
> 
> So when you suggest to replace the last two lines by
> "/etc/init.d/S40wlan start", how is this going to work considering that
> starting the S40wlan script has already been done at boot time ?

 If no ssid/password is configured, wpa_supplicant will just not connect, it
will just run as daemon. Same for udhcpc, it will just retry until the interface
is up.

 But you're right: it should be restart instead of start, so that the running
wpa_supplicant and udhcpc are killed before restarting them.


>>> +load_modules()
>>> +{
>>> +	while IFS= read -r line; do
>>> +		modprobe -a $line
>>> +	done < "/etc/modules-load.d/modules.conf"
>>> +}
>>> +
>>> +load_modules
>>> +echo "Loading modules: OK"  
>>
>>  Init scripts should handle the start and stop arguments, otherwise the module
>> will be loaded again during shutdown.
>>
>>  Also, I don't think it makes a lot of sense to introduce all this flexibility.
>> Just include 'modprobe -a brcmfmac' to S40wlan.
> 
> Not directly related to Jagan's submission, but we do have this need to
> load modules at startup for a number of platforms. Isn't it time to
> have a generic init script that reads /etc/modules for this ? It's also
> a question that has been asked a number of times on IRC: "how do I ask
> my Buildroot system to load a kernel module at startup". Of course the
> answer is simple: add an init script, but since the question has been
> asked many times, perhaps it's worth adding some generic script ?

 Yes indeed. Perhaps a separate package like ifupdown-scripts. It should
probably depend on !UDEV.

 This could also be used for arcturus then.

> Or maybe in this case mdev support should be enabled to ensure modules
> are loaded automatically ?

 Probably, yes, since in most cases you need firmware as well. Actually, good
point: isn't mdev needed anyway to load the firmware? Oh, right, the kernel will
autoload since 4.something so all the defconfigs we have that add mdev "For
automatic firmware loading" are actually wrong...

 But yes, mdev is probably the easier way.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
