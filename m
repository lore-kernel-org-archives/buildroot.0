From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jun 2019 00:05:07 +0200
Subject: [Buildroot] [External] Re: [PATCH v2 1/1] package/hostapd: add
 debug information options
In-Reply-To: <CAM=7fbdLrLEWdC+hKVUywG273Z6CHkuT2irQ1f_7ogDj6aapfg@mail.gmail.com>
References: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
 <20190617194121.64c14291@windsurf>
 <CAM=7fbd717PmwGE5Dh4Wi4AGhY14Pb7tabG7qrxCsgdCgDQ-LQ@mail.gmail.com>
 <20190617210223.77a97ee2@windsurf>
 <CAM=7fbdLrLEWdC+hKVUywG273Z6CHkuT2irQ1f_7ogDj6aapfg@mail.gmail.com>
Message-ID: <45689e33-2ed3-2568-521a-b12e1245a4fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/06/2019 22:27, Jared Bents wrote:
> On Mon, Jun 17, 2019 at 2:02 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Mon, 17 Jun 2019 12:56:08 -0500
>> Jared Bents <jared.bents@collins.com> wrote:
>>
>>>> Could you explain what CONFIG_DEBUG_FILE is doing compared to
>>>> CONFIG_DEBUG_SYSLOG, and why one is conditional and not the other ? Do
>>>> we really want CONFIG_DEBUG_FILE unconditionally ?
>>>
>>> I based it off of wpa_supplicant's implementation for each.  In
>>> wpa_supplicant, CONFIG_DEBUG_FILE is turned on unconditionally while
>>> CONFIG_DEBUG_SYSLOG is optional.  CONFIG_DEBUG_FILE enables a runtime
>>> option (-f) to specify a file to direct the hostapd output to instead
>>> of stdout.  CONFIG_DEBUG_SYSLOG enables a runtime option (-s) to have
>>> the output go to syslog instead of stdout.  These are purely optional
>>> at runtime as if neither of the -f or -s command line arguments are
>>> used, the output will go to stdout as before.
>>
>> What is the size impact of each option, compared to the overall
>> installation size of hostapd ?
> 
> I haven't been able to determine a size impact.  When trying to see a
> size difference, I am getting sizes for hostapd varying between 1.4M
> and 1.6M without any real correlation with whether I have one of the
> two options selected, both selected, or neither of them selected

 I've done a native build of all combinations, with -g0 and strip, and it always
gives 380K.

 Which is not surprising. The only difference is one additional condition and
function call. The syslog option might make a tiny difference when linking
statically (which I haven't tried) because it doesn't need to include the
openlog() and syslog() functions.

 So no, it's not worth to make this configurable.

 For wpa_supplicant, the syslog option was added in 2013. I guess at the time
nobody wondered about the size impact. The file option was forced on in 2015 -
at that time, the size impact was considered and measured to be 963 bytes so no
user-configurable option was added for it.

 Regards,
 Arnout
