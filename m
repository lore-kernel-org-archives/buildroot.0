From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 09:06:48 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <20130918185155.0c045e28@skate>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <20130918185155.0c045e28@skate>
Message-ID: <CAAXf6LUXa6ep3KMMxVVvVKC0AxBM_Mboy2+SFtmBixQ-Zj6s-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 18, 2013 at 6:51 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
[..]
>
> I do certainly welcome some help with Apache configuration to make the
> rewrite rules behave better. I hate doing sysadmin stuff, so when it
> worked more or less, I considered it good enough :)
>
> What I currently have is:
>
>         RewriteEngine on
>         RewriteCond %{REQUEST_FILENAME} !-f
>         RewriteCond %{REQUEST_FILENAME} !-d
>         RewriteRule ^/results/([a-f0-9]{3})([a-f0-9]{37})/(.*) /results/$1/$1$2/$3 [L]
>
> this is needed because the old URLs were:
>
>         /results/<complete-hash>/
>
> while the way it's stored (and the new URLs) are:
>
>         /results/<first three chars of hash>/<complete-hash>/

This is untested, but should work:
        RewriteRule ^/results/([a-f0-9]{3})([a-f0-9]{37})/?(.*)
/results/$1/$1$2/$3 [L]

This would also accept URLs of the form /results/<complete-hash>foo
without any slash in between, but this would then fail after
redirection I think. If you do not want that, I think you need two
rules:
        RewriteRule ^/results/([a-f0-9]{3})([a-f0-9]{37})/?
/results/$1/$1$2/ [L]
        RewriteRule ^/results/([a-f0-9]{3})([a-f0-9]{37})/(.*)
/results/$1/$1$2/$3 [L]

The set of two rules is maybe cleaner, but I leave it up to you.

Best regards,
Thomas
