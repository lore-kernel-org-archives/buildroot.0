From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 22:05:48 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <20160526215929.61993c8f@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 26 May 2016 21:59:29 +0200")
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <87bn3s61en.fsf@dell.be.48ers.dk>
 <20160526215929.61993c8f@free-electrons.com>
Message-ID: <8737p460v7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 26 May 2016 21:54:08 +0200, Peter Korsgaard wrote:

 >> Can dd detect and do something sensible about sparse files? I thought it
 >> was only able to create sparse files (by seeking)? I would guess you
 >> need a tool that understand the filesystem to know if you can really
 >> skip sequences of zeros when writing.

 > man dd(1):

 >        sparse try to seek rather than write the output for NUL input blocks

 > So it doesn't seem to need a sparse file, it's just that it detects
 > blocks that are completely zero and does not write them.

Yes, but you cannot safely use that. What if you have a file on your
filesystem containing a block of zeroes? (or as part of the filesystem
meta data like block bitmap or journal) You need to make sure that does
get written to the card, otherwise you will read back whatever was
written before to the card.

-- 
Venlig hilsen,
Peter Korsgaard 
