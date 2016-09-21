From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 21 Sep 2016 23:47:02 +0200
Subject: [Buildroot] [PATCH] systemd: let getty instead of serial-getty
 handle /dev/console
In-Reply-To: <20160921220545.238279e6@gmx.net>
References: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
 <20160911210951.GP5740@free.fr> <87intpzqge.fsf@dell.be.48ers.dk>
 <20160921220545.238279e6@gmx.net>
Message-ID: <68b49446-0228-174d-ad47-9209d23ae90a@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/2016 10:05 PM, Peter Seiderer wrote:
> Hello *,
>
> On Wed, 21 Sep 2016 09:01:37 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
>
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>   > Floris, All,
>>   > On 2016-09-09 18:10 +0200, Floris Bos spake thusly:
>>   >> The serial-getty unit depends on dev-%i.device which does not
>>   >> seem to be created for /dev/console
>>   >> Workaround this by letting normal getty unit handle things
>>   >> if BR2_TARGET_GENERIC_GETTY_PORT is set to 'console'
>>   >>
>>   >> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>>
>>   > I haven't tested that, but I think this is OK just on principle.
>>
>>   > I just wonder if that behaves correctly when console is a serial line or
>>   > anything else (e.g. a VT on HDMI, or through a debug channel...)
>>
>> Yeah, me too. Does anybody know what the difference exactly is between
>> getty/serial-getty, and when one should be used over the other?
>>
> Tested for the rpi3/glibc/systemd case and failed: I get a doubled
> (and unusable) ' Welcome to Buildroot/buildroot login:' on serial and
> no login on hdmi...

Empty cmdline.txt will give hdmi.

Recall you need "console=serial0,115200 console=tty1" with tty1 last in 
cmdline.txt if you want them simultaneous.
So that tty1 becomes /dev/console and serial is handled by systemd's 
automatic getty generator.

Perhaps there is an issue if you have the order swapped, and both 
systemd's automatic stuff and the manual symlink try to display a getty 
on serial.
Not sure how to disable systemd's automatic behavior.



Yours sincerely,

Floris Bos
