From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 21 Oct 2014 08:15:03 +0100
Subject: [Buildroot] google-breakpad experiences?
In-Reply-To: <CAAXf6LVFqiMj0H0P_Qfpkeobrkb=28Art8_d2ga_-SOd8M5Baw@mail.gmail.com>
References: <CAAXf6LWEBuVmnXosLpkjw0O9aVvGCBE2s=9e1PN6W5S7pK98+g@mail.gmail.com>
 <543E8D2E.70404@carallon.com>
 <CAAXf6LVFqiMj0H0P_Qfpkeobrkb=28Art8_d2ga_-SOd8M5Baw@mail.gmail.com>
Message-ID: <544607F7.9040807@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/2014 19:44, Thomas De Schampheleire wrote:
> Hi Will,
>
> On Wed, Oct 15, 2014 at 5:05 PM, Will Wagner <willw@carallon.com> wrote:
>
>> We have successfully been using google-breakpad for a few years. However it
>> is only on x86 and arm targets and we have our own internal package (it
>> pre-dates the one now upstream but is broadly similar, we have a number of
>> custom patches as well).
>>
>> Are you trying to generate dumps within the crashed process or are you
>> running the crash server? We have found the latter to be much more reliable.
>
> Currently I'm simply trying the test program described at:
> https://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide
>
> which is dumping from within the crashed process.

The example works fine on our platforms.

>
> How does this crash server work? I must say the documentation of
> google-breakpad is not very extensive.

You start up another process before creating the ExceptionHandler object 
(passing in a descriptor via server_fd). The advantage of out-of-process 
dump generation is that you don't have to worry about a corrupted 
environment & C library.

The documentation is indeed poor and help on the forums was never great 
either. I tried to upstream our patches but never got any response on 
them either.

>
> Could you also elaborate on the unreliabilities you have encountered
> with the first method?

The problem we have seen with this is that in a number of crash 
scenarios it never produces a dump because something is wrong in the c 
library. Also we are able to put extra functionality into the crash 
server process so it can offer to email files, save to usb key etc.


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
