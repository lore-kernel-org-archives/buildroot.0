From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 22:20:20 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
 <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
Message-ID: <20141009222020.5bd77d67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, 9 Oct 2014 18:40:05 +0200, Angelo Compagnucci wrote:

> > Thanks, but I know nothing about Mono, so what command am I supposed to
> > run on the target to reproduce the issue?
> 
> Sorry, sometimes I forget my stupidity ...
> 
> Attached you can find a minimal mono example.
> 
> You can compile it with:
> 
> mcs weblient.cs
> 
> and run it with
> 
> mono webclient.exe http://www.google.com
> 
> It should suffice for triggering the error.

It indeed triggers an error here, but not the same as yours:

# mono webclient.exe http://www.google.com

Unhandled Exception:
System.Net.WebException: An error occurred performing a WebClient request. ---> System.NotSupportedException: http://www.google.com/
  at System.Net.WebRequest.GetCreator (System.String prefix) [0x00000] in <filename unknown>:0 
  at System.Net.WebRequest.Create (System.Uri requestUri) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.GetWebRequest (System.Uri address) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.SetupRequest (System.Uri uri) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.OpenRead (System.Uri address) [0x00000] in <filename unknown>:0 
  --- End of inner exception stack trace ---
  at System.Net.WebClient.OpenRead (System.Uri address) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.OpenRead (System.String address) [0x00000] in <filename unknown>:0 
  at (wrapper remoting-invoke-with-check) System.Net.WebClient:OpenRead (string)
  at Test.Main (System.String[] args) [0x00000] in <filename unknown>:0 
[ERROR] FATAL UNHANDLED EXCEPTION: System.Net.WebException: An error occurred performing a WebClient request. ---> System.NotSupportedException: http://www.google.com/
  at System.Net.WebRequest.GetCreator (System.String prefix) [0x00000] in <filename unknown>:0 
  at System.Net.WebRequest.Create (System.Uri requestUri) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.GetWebRequest (System.Uri address) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.SetupRequest (System.Uri uri) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.OpenRead (System.Uri address) [0x00000] in <filename unknown>:0 
  --- End of inner exception stack trace ---
  at System.Net.WebClient.OpenRead (System.Uri address) [0x00000] in <filename unknown>:0 
  at System.Net.WebClient.OpenRead (System.String address) [0x00000] in <filename unknown>:0 
  at (wrapper remoting-invoke-with-check) System.Net.WebClient:OpenRead (string)
  at Test.Main (System.String[] args) [0x00000] in <filename unknown>:0 

It happens either with webclient.exe built using mcs on the host
machine, or mcs on the target machine.

Another thing I've noticed is that the Mono installation is
*huge*. /usr/lib/mono takes 132 MB. Is all of it necessary?

Also, why do you have two packages, mono-managed and mono-native? One
builds the stuff for the host, and one builds the stuff for the target.
It could simply be one single package called mono, which builds both
for the host and the target.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
