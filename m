From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 12:18:41 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/import.inc.php: account
 for failures that contain an images/ path
In-Reply-To: <ae30e2fd-d790-5040-4cca-ca53b17d13d1@mind.be>
References: <20190616201338.4593-1-thomas.petazzoni@bootlin.com>
 <ae30e2fd-d790-5040-4cca-ca53b17d13d1@mind.be>
Message-ID: <20190618121841.5f7276ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jun 2019 21:39:22 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > This commit adjusts the ugly PHP code with even more ugliness to take  
> 
>  This sounds like a great idea :-)

Isn't it :-)

>  Note that the Python code already has similar logic to extract the reason. Why
> don't we save that logic as part of the tarball in a "reason" file, and extract
> it from there?

Because history, but indeed it would make a lot more sense to extract
the reason only on the client side, because we anyway extract it
already to be able to extract the relevant part of the build log.

>  That said, we still have to support the legacy database which doesn't have that
> "reason" file. So it's still useful to apply this patch.

There is really no "legacy" to support here. On the server side, when a
result is submitted, the reason is extracted from the build log, and
then stored in the SQL database. Once that is done, when browsing build
results, the reason is always taken from the SQL database.

So server-side, we can entirely drop the logic that calculates the
reason from the build log, and instead replace it with just reading the
reason from an additional "reason" file in the result tarball submitted
by build slaves.

What needs to be done however is a transition period:

 - Adding the "reason" file to the build results on the client side is
   implemented.

 - This change is deployed to all build slaves.

 - Once it's deployed to all build slaves, we can change the server
   side to use the reason file instead of calculating the reason
   manually.

Or we could avoid that transition by using the reason file if
available, and fall back to the old logic if not available.

In the mean time, should I still apply this patch ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
