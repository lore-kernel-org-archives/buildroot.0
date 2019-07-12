From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Jul 2019 15:37:46 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 2/4] web/index.php: add
 support for symbols to be passed via GET
In-Reply-To: <20190708081707.28348-3-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
 <20190708081707.28348-1-victor.huesca@bootlin.com>
 <20190708081707.28348-3-victor.huesca@bootlin.com>
Message-ID: <20190712153746.7d4c7292@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

On Mon,  8 Jul 2019 10:17:05 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> This patch add support of a `symbols[<symbol>]=<value>` option via GET as it is
> done with other fields.

And it also implements date[...]=..., which should be in a separate patch.

> The syntax used is `symbols[<symbol>]=<value>`, so multiple symbols can be
> passed while the url is still readable and symbols are clearly isolated from
> other fields.
> These symbols are forwared to the backend to be integrated in the sql query.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

It would be good to have another page that documents the HTTP query
arguments that this page understands, because these are not visible at
all through the front page.

> diff --git a/web/index.php b/web/index.php
> index f3af62d..289a866 100644
> --- a/web/index.php
> +++ b/web/index.php
> @@ -34,7 +34,18 @@ function format_url_args($args)
>  	));
>  }
>  
> +function setup_date($dates)
> +{
> +  if (isset($dates['from']) && isset($dates['to']))
> +    return $dates;
> +  else if (isset($dates['from']))
> +    return $dates['from'];
> +  else if (isset($dates['to']))
> +    return array('to' => $dates['to']);
> +}

Is this all really needed ? The last case just turns a dict with a "to"
key.. into a dict with a "to" key. And the second case turns a dict
with a "from" key into just the value, while your PATCH 1/4 implements
support for understanding a dict with a "from" key as well.

So, to me, this setup_date() function seems not necessary.

But again, it should be a separate patch.

> +
>  $filters = array();
> +$symbols = array();

I think this separate array should not be needed (see my comments on
PATCH 1/4).

>  
>  /* When no start is given, or start is a crazy value (not an integer),
>     just default to start=0 */
> @@ -53,7 +64,7 @@ if ($step > 250)
>  
>  $valid_status = array("OK", "NOK", "TIMEOUT");
>  
> -if (isset ($_GET['status']) && in_array($_GET['status'], $valid_status))
> +if (isset($_GET['status']) && in_array($_GET['status'], $valid_status))

This is a cosmetic change unrelated to this commit, should be part of
another patch.

Hint: use "git add -p" to stage your changes. This way, you can have
multiple changes in a file, and still put them into separate commits.

>    $filters["status"] = $_GET['status'];
>  
>  if (isset($_GET['arch']) && preg_match("/^[a-z0-9_]*$/", $_GET['arch']))
> @@ -74,9 +85,15 @@ if (isset($_GET['static']) && preg_match("/^[0-1]$/", $_GET['static']))
>  if (isset($_GET['subarch']) && preg_match("/^[A-Za-z0-9_\+\.\-]*$/", $_GET['subarch']))
>    $filters["subarch"] = $_GET['subarch'];
>  
> -if (isset ($_GET['submitter']))
> +if (isset($_GET['submitter']))

Also unrelated cosmetic change.

>    $filters["submitter"] = urldecode($_GET['submitter']);
>  
> +if (isset($_GET['symbols']) && is_array($_GET['symbols']))
> +  $symbols = $_GET['symbols'];

Use:

     $filters["symbols"] = $_GET['symbols'];

> +
> +if (isset($_GET['date']))
> +  $filters["date"] = setup_date($_GET['date']);

Should be in the separate patch that adds support for date filtering.

> +
>  bab_header("Buildroot tests");
>  
>  echo "<table>\n";
> @@ -85,7 +102,7 @@ echo "<tr class=\"header\">";
>  echo "<td>Date</td><td>Duration</td><td>Status</td><td>Commit ID</td><td>Submitter</td><td>Arch/Subarch</td><td>Failure reason</td><td>Libc</td><td>Static?</td><td>Data</td>";
>  echo "</tr>";
>  
> -$results = bab_get_results($start, $step, $filters);
> +$results = bab_get_results($start, $step, $filters, $symbols);

With the above change to use $filters to pass the array of symbols,
this change should no longer be needed.

> -$total = bab_total_results_count($filters);
> +$total = bab_total_results_count($filters, $symbols);

Ditto.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
