From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Sep 2012 23:51:45 +0200
Subject: [Buildroot] [PATCH 3/9] firefox: sqlite dependency needs new
 compile-time options
In-Reply-To: <1346855344-15081-4-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-4-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <504FB271.4020300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/12 16:28, Stefan Fr?berg wrote:
>
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Small comments below.

> ---
>   package/sqlite/Config.in |   34 ++++++++++++++++++++++++++++++++++
>   package/sqlite/sqlite.mk |   12 ++++++++++++
>   2 files changed, 46 insertions(+), 0 deletions(-)
>
> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
> index 25aaa3f..75bce70 100644
> --- a/package/sqlite/Config.in
> +++ b/package/sqlite/Config.in
> @@ -22,3 +22,37 @@ config BR2_PACKAGE_SQLITE_STAT3
>   	  planner that can help SQLite to choose a better query plan under
>   	  certain situations.
>
> +config BR2_PACKAGE_SQLITE_ENABLE_FTS3
> +	bool "Enables version 3 of the full-text search engine"

  "Full-text search engine (fts3)"

> +	depends on BR2_PACKAGE_SQLITE

  Instead of a "depends on" every time, just enclose all the options in an
if block.

> +	help
> +	  When this option is defined in the amalgamation
> +	  (see http://www.sqlite.org/amalgamation.html), version 3 of
> +	  the full-text search engine is added to the build automatically.

  Is it relevant whether it's an amalgamation or a split build?

  I'd just write:

Adds the full-text search engine (version 3) to the build.

> +
> +config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
> +	bool "Enables sqlite3_unlock_notify() interface"

  "sqlite3_unlock_notify() interface"

> +	depends on BR2_PACKAGE_SQLITE
> +	help
> +	  This option enables the sqlite3_unlock_notify() interface and its
> +	  accosiated functionality. See the documentation

  associated

> +	  http://www.sqlite.org/unlock_notify.html for additional information.
> +
> +config BR2_PACKAGE_SQLITE_SECURE_DELETE
> +	bool "Sets the secure_delete pragma on by default"
> +	depends on BR2_PACKAGE_SQLITE
> +	help
> +	  This compile-time option changes the default settings of the
> +	  secure_delete pragma. When this option is not used, secure_delete
> +	  defaults to off. When this option is present, secure_delete defaults
> +	  to on.
> +
> +	  The secure_delete setting causes deleted content to be overwritten
> +	  with zeros. There is a small performance penalty for this since
> +	  additional I/O must occur. On the other hand, secure_delete can
> +	  prevent sensitive information from lingering in unused parts
> +	  of the database file after it has allegedly been deleted.
> +	  See the documentation on the
> +	  http://www.sqlite.org/pragma.html#pragma_secure_delete
> +	  for additional information.

  Is this needed for firefox?  (Not that it matters, mind you.)

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
