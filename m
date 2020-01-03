From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:34:09 +0100
Subject: [Buildroot] [PATCH 08/11] support/scripts/pkg-stats: add
 generic package status field
In-Reply-To: <20200103151849.10956-9-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-9-heiko.thiery@gmail.com>
Message-ID: <20200103163409.141a5e8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jan 2020 16:18:45 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 324700adbf..b0c2db2b93 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -112,6 +112,7 @@ class Package:
>          self.url_status = None
>          self.url_worker = None
>          self.rm_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
> +        self.status = {}
>  
>      def pkgvar(self):
>          return self.name.upper().replace("-", "_")
> @@ -121,6 +122,7 @@ class Package:
>          Fills in the .url field
>          """
>          self.url_status = "No Config.in"
> +        self.status['url'] = ("error", "no Config.in")

Here it is duplicating the url_status field, I believe we want to avoid
that.

>          for filename in os.listdir(self.pkg_path):
>              if fnmatch.fnmatch(filename, 'Config.*'):
>                  fp = open(os.path.join(self.pkg_path, filename), "r")
> @@ -128,9 +130,11 @@ class Package:
>                      if URL_RE.match(config_line):
>                          self.url = config_line.strip()
>                          self.url_status = "Found"
> +                        self.status['url'] = ("ok", "found")

Ditto.

>                          fp.close()
>                          return
>                  self.url_status = "Missing"
> +                self.status['url'] = ("error", "missing")

Ditto.

>                  fp.close()
>  
>      def set_infra(self):
> @@ -155,11 +159,16 @@ class Package:
>          Fills in the .has_license and .has_license_files fields
>          """
>          var = self.pkgvar()
> +        self.status['license'] = ("error", "missing")
> +        self.status['license-files'] = ("error", "missing")
>          if var in self.all_licenses:
>              self.has_license = True
>              self.license = self.all_licenses[var]
> +            self.status['license'] = ("ok", "found")
> +
>          if var in self.all_license_files:
>              self.has_license_files = True
> +            self.status['license-files'] = ("ok", "found")

Here it's duplicating self.has_license and self.has_license_files
basically.

>      def set_hash_info(self):
>          """
> @@ -167,6 +176,10 @@ class Package:
>          """
>          hashpath = os.path.join(self.pkg_path, self.name + '.hash')
>          self.has_hash = os.path.exists(hashpath)
> +        if self.has_hash:
> +            self.status['hash'] = ("ok", "found")
> +        else:
> +            self.status['hash'] = ("error", "missing")

Same for self.has_hash.

Can we do better ? Maybe the issues is that pkg-stats does both
extracting the data to a JSON format *and* presenting it as HTML. Maybe
it should be separated into two tools:

 - One doing the data extraction and generation of JSON

 - One using the JSON to produce the HTML page, which would be replaced
   by your new site

I'm not sure exactly how to go, but I'm not a big fan of this patch
that duplicates information that already exists (and which doesn't
explain why).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
