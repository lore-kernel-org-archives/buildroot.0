From: =?utf-8?Q?Pongr=C3=A1cz_Istv=C3=A1n?= <pongracz.istvan@gmail.com>
Date: Tue, 7 Nov 2017 20:58:55 +0100
Subject: [Buildroot] SOLVED Re: gtk binary application -
 pango_layout_set_text assertion - empty strings on the UI
In-Reply-To: <1616c92b-3236-6b31-c098-1f7904faa267@mind.be>
Message-ID: <17c6a08630a49976f8c300882add1f54@www.startit.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi and thank you for your answer!

Meanwhile I solved this problem:
- gconv package must be compiled and put into the right place
- any font should be at /usr/share/fonts as expected

And at viola, everything is working.

Yes, the gtk application called pwr_rtmon is not part of buildroot, but a precompiled binary from the outer space :)

The solution was much simpler than I expected.

Cheers,
Istv?n

 
----------------eredeti ?zenet-----------------
Felad?: "Arnout Vandecappelle" arnout at mind.be 
C?mzett: "Pongr?cz Istv?n" 
, "buildroot busybox.net" buildroot at busybox.net 
D?tum: Sat, 28 Oct 2017 19:13:36 +0200
-------------------------------------------------
 
 
> 
> 
> On 26-10-17 14:57, Pongr?cz Istv?n wrote:
>> Hi,
>> 
>> I have an issue with buildroot, when I run a gtk application built for
>> debian/i386 over ssh/X forwarding.
> 
> With "a gtk application" you mean a custom application, not an existing
> package, right?
> 
>> 
>> The GUI shows empty strings instead of texts, even fonts are available.
>> 
>> Here is an image where you can see the issue
>> exactly: https://imagebin.ca/v/3f78XVw6bLW2
>> 
>> In parallel, I can see the following in the console:
>> 
>> 
>> 
>> Lot of messages, exactly the same:
>> 
>> (pwr_rtmon:354): Pango-CRITICAL **: pango_layout_set_text: assertion 
>> 'length ==
>> 0 || text != NULL' failed
>> 
>> On startup of the applicaion I can see some of this (image loading for icons):
>> 
>> (pwr_rtmon:354): GdkPixbuf-WARNING **: Couldn't convert text chunk value 
>> to UTF-8.
> 
> So, this looks like bugs in the pwr_rtmon application. It seems to be sending
> an invalid UTF-8 string to pango.
> 
> I would suggest debugging the application first.
> 
> 
> Regards,
> Arnout
> 
>> 
>> What I tried:
>> 
>> * Adding more and more fonts from the desktop -> the already exists texts
>> changed a little bit, depending the used font, otherwise no effect
>> * Deleting all fonts -> the characters on the shown buttons changed to black
>> boxes, so, no texts but only bloxes (no fonts found)
>> * I tried to add more and more X related applications, even xorg-server -> no
>> effect
>> * Using strace -f -ff -e open,read -o log.log whatever -> I can see the opened
>> fonts etc.
>> * Now I try to add gtk3 and gtk-demos to see, what happens with the demo
>> applications.
>> 
>> Buildroot background:
>> 
>> * 2016.2, glibc (wchar)), busybox, gtk_engines, X.org X Window System 
>> (without
>> X11R7 Servers), 
>> 
>> I am pretty sure, the problem is not a missing font, but I cannot step forward
>> at this moment. I suspect some UTF-8 issue, but I have no proof except I 
>> already
>> provided.
>> 
>> Do you have any hints, how to catch the problem?
>> 
>> Thank you!
>> 
>> Istv?n
>> 
>> 
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net 
>> http://lists.busybox.net/mailman/listinfo/buildroot
>> 
> 
> -- 
> Arnout Vandecappelle arnout at mind be
> Senior Embedded Software Architect +32-16-286500
> Essensium/Mind http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
