From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jul 2020 10:52:08 +0200
Subject: [Buildroot] [PATCH 6/9] package/pkg-utils: cve.py: Handle
 exception when version comparison fails
In-Reply-To: <20200708164006.859021-7-gregory.clement@bootlin.com>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-7-gregory.clement@bootlin.com>
Message-ID: <20200709105208.6949668a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jul 2020 18:40:03 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> With python 3, when a package has a version number x-y-z instead of
> x.y.z, then the version returned by LooseVersion can't be compared
> which raises an exception.
> 
> This patch handles this exception by adding a new return value when
> the comparison can't be done.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Could you re-organize the series to have this patch first ? Indeed,
this is a fix, we want to apply it both to master *and* backport it to
older branches as well.

I just ran pkg-stats this morning on a Python 3.x system, and it
exploded due to this exception.

However, are you sure just this patch as-is works fine ? The "affects"
function returned just a boolean, and now in some cases it returns a
string. How can this work without changes elsewhere in the code ?

I think it is not a great design to have a function that sometimes
returns a boolean type, sometimes returns a string. It probably needs
to be changed to return:

	CVE_AFFECTS
	CVE_DOESNT_AFFECT
	CVE_UNKNOWN

or some other similar macros.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
