From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Jul 2019 15:29:05 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 1/4] web/{funcs,
 db}.inc.php: add support for symbols in sql query
In-Reply-To: <20190708081707.28348-2-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
 <20190708081707.28348-1-victor.huesca@bootlin.com>
 <20190708081707.28348-2-victor.huesca@bootlin.com>
Message-ID: <20190712152905.4eea395d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

Thanks for working on this topic!

On Mon,  8 Jul 2019 10:17:04 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> This patch provide a way to filter results from database with a list of symbols.

I think using just the terminology "symbols" is a bit unclear. Instead
"configuration symbols" or "configuration options" would be better.

So perhaps:

""
This patch improves the bab_get_results() and bab_total_results_count()
so that we can filter autobuilder results from the database with a list
of configuration options and values.
""

> This query has been optimized to scale the best it can when multiple symbols are
> asked together. Actually I found 3 way to get the same results: `join`, `where in`
> and `intersect`.

"This" in "This query" doesn't mean much since there is no mention if a
query before. So just say "The SQL query". Also, avoiding first person
sentences in commit logs is typically preferred, i.e:

"""
The SQL query has been optimized to scale as best as possible when the
filtering takes place on multiple configuration options/values. We
identified three solutions for this SQL query, each providing the same
results: join, where in and intersect:
"""

> - The 1st one is really not usable in practice since it only returns results if
> the symbols subquery return only a douzen of rows and there no more than 2 or 3

return -> returns

douzen -> dozen

there no -> there are no

> symbols asked at the same time.

It really doesn't return any results ? Or is it that it is massively
slow ?

> - The 2nd can handle queries where thousand rows are involved -- which is still

thousand *of* rows. Also, we're not sure if by "rows" you're talking
about the build results or the config symbols.

> less than common cases -- but on a very limited number of symbols too. We could

I don't follow what you mean by "but on a very limited number of symbols too"

> have hope a better result but it is still a way better than join.

> - The last is the one realy want to use. It can handle any number of symbols

"is the one we really want to use".

> with any number of rows and return a result in a few seconds.
> 
> Unfortunalty this query make use of `intersect` which is not implemented in

Unfortunately

make -> makes

> mysql. However mariaDB implemented this feature in 2017 w/ the version 10.3.10
> but our current databse is an oracle mysql not a mariaDB :(

database

> We planned to move the database to an other server but since it is an stable

another

> debian, the mariadb verison is too old to support select.

version

select -> intersect

> I implemented a dynamic check of mysql version. The type of query use to

"Therefore, this commit implements a dynamic check of MySQL's version".

> handle symbols read this version and use `intersect` in case when the

read -> reads
use -> uses

"and uses intersect when it is supported".

> version supports it.
> 
> TDRL; The select on symbols works but is not optimal yet. It will be optimal
> as soon as the database support `intersect` without changing the php code.

TDRL -> TLDR.

But I'm not sure if this TLDR is really useful. The implementation is
optimal, it's just the current deployment that isn't.

> diff --git a/web/db.inc.php b/web/db.inc.php
> index 99f83a2..f8b10a2 100644
> --- a/web/db.inc.php
> +++ b/web/db.inc.php
> @@ -54,6 +54,30 @@ class db
>  
>      return $value;
>    }
> -}
>  
> -?>  
> \ No newline at end of file
> +
> +  // Test whereas the database the support a given feature
> +  function has_feature($feature)
> +  {
> +    // Return -1 on v1 < v2, 0 on v1 = v2 and 1 on v1 > v2
> +    $compare_versions = function($v1, $v2) {
> +      for ($i = 0; $i < min(sizeof($v1), sizeof($v2)); $i++)
> +        if ($v1[$i] != $v2[$i])
> +          return $v1[$i] - $v2[$i];
> +      return 0;
> +    };
> +
> +    switch ($feature) {
> +      case 'intersect': // SELECT was introduced in mariadb version 10.3.10
> +        $res = $this->query("select version() version;");
> +        $ver = mysqli_fetch_object($res)->version;
> +        preg_match("/^(\d+(?:\.\d+)*)-.+$/", $ver, $match);
> +        $version = array_map(function ($v) { return (int)$v; }, explode('.', $match[1]));
> +        return $compare_versions($version, array(10, 3, 10)) >= 0;
> +
> +      default:
> +        throw new Exception("Unknown feature", 1);
> +    }
> +  }

This could be added as a preliminary patch, separate from the filtering
logic.

> diff --git a/web/funcs.inc.php b/web/funcs.inc.php
> index 7e912c1..6bf11be 100644
> --- a/web/funcs.inc.php
> +++ b/web/funcs.inc.php
> @@ -1,4 +1,5 @@
>  <?php
> +set_time_limit(0);

This is probably some left-over debugging.

>  include(dirname(__FILE__) . "/../web/config.inc.php");
>  include(dirname(__FILE__) . "/../web/db.inc.php");
>  
> @@ -30,6 +31,24 @@ function bab_footer()
>    echo "</html>\n";
>  }
>  
> +function bab_format_sql_symbols($db, $symbols)

Perhaps: bab_format_sql_config_symbol_filter() would be better.

> +{
> +  $get_res_id = "select result_id id from symbol_per_result where symbol_id = (select id from config_symbol where name=%s and value=%s)";
> +
> +  $r = array_map(
> +    function($name, $value) use ($db, $get_res_id) {
> +      return sprintf($get_res_id, $db->quote_smart($name), $db->quote_smart($value));
> +    },
> +    array_keys($symbols),
> +    $symbols
> +  );
> +
> +  if ($db->has_feature('intersect'))
> +    return implode(" intersect ", $r);
> +  else
> +    return implode(" and result_id in (", $r) . str_repeat(")", count($symbols)-1);
> +}
> +
>  function bab_format_sql_filter($db, $filters)
>  {
>  	$status_map = array(
> @@ -44,27 +63,35 @@ function bab_format_sql_filter($db, $filters)
>  				return sprintf("%s like %s", $k, $db->quote_smart($v));
>  			else if ($k == "status")
>  				return sprintf("%s=%s", $k, $db->quote_smart($status_map[$v]));
> -			else
> +      elseif ($k == "date")
> +        if (is_array($v)) {
> +          if (isset($v['from'], $v['to']))
> +            return sprintf("builddate between %s and %s", $db->quote_smart($v['from']), $db->quote_smart($v['to']));
> +          else if (isset($v['to']))
> +            return sprintf("builddate<=%s", $db->quote_smart($v['to']));
> +          else
> +            return sprintf("builddate>=%s", $db->quote_smart($v['from']));
> +        } else // Assuming the date is a lower-bound
> +          return sprintf("builddate>=%s", $db->quote_smart($v));

This date filtering is unrelated to the configuration symbol filtering,
it should be a separate patch. Also, the indentation is bogus.

> +      else
>  				return sprintf("%s=%s", $k, $db->quote_smart($v));
>  		},
>  		$filters,
>  		array_keys($filters)
>  	));
>  
> -	if (count($filters))
> -		return "where " . $sql_filters;
> -	else
> -		return "";
> +  return (count($filters) ? "where " . $sql_filters : "");

This is some unrelated refactoring, should be in a separate patch.

>  /*
>   * Returns the total number of results.
>   */
> -function bab_total_results_count($filters)
> +function bab_total_results_count($filters, $symbols)
>  {
>    $db = new db();
>    $condition = bab_format_sql_filter($db, $filters);
> -  $sql = "select count(*) from results $condition;";
> +  $symbols_condition = bab_format_sql_symbols($db, $symbols);
> +  $sql = "select count(*) from results ".(count($symbols) > 0 ? "inner join ($symbols_condition) SYMBOLS using (id)" : "")."$condition;";

Can we do it like this perhaps:

     $sql = "select count(*) from results";

     if ($symbols_condition != "")
            $sql .= " inner join ($symbols_condition) symbols using (id) ";

     if ($condition != "")
            $sql .= " " . $condition";

     $sql .= ";"

And use lower-case "symbols" instead of "SYMBOLS" in upper-case.

>    $ret = $db->query($sql);
>    if ($ret == FALSE) {
>      echo "Something's wrong in here\n";
> @@ -80,13 +107,14 @@ function bab_total_results_count($filters)
>   * and limited to $count items. The items starting with $start=0 are
>   * the most recent build results.
>   */
> -function bab_get_results($start=0, $count=100, $filters = array())
> +function bab_get_results($start=0, $count=100, $filters = array(), $symbols = array())
>  {
>    global $status_map;
>    $db = new db();
> -
> +  $symbols_condition = bab_format_sql_symbols($db, $symbols);
>    $condition = bab_format_sql_filter($db, $filters);
> -  $sql = "select * from results $condition order by builddate desc limit $start, $count;";
> +  $sql = "select * from results ".(count($symbols) > 0 ? "inner join ($symbols_condition) SYMBOLS using (id)" : "")."$condition order by builddate desc limit $start, $count;";

Same comment as above.

But overall, I am wondering if it isn't the bab_format_sql_filter()
function that should be responsible for generating the condition. After
all, the symbols are part of the filtering.

So, what about having $filters["symbols"] contain what you pass as
$symbols. It really is a filter. It would also avoid duplicating the
logic to build the SQL query between bab_get_results() and
bab_get_total_result_count().

Of course, you can keep a sub-function bab_format_sql_symbols(), but it
would be called by bab_format_sql_filter().

Does that make sense ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
