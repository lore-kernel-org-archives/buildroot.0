From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:09 +0200
Subject: [Buildroot] [PATCH 01/13] scancpan: wrap abstract if too long
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[note: code style fixed]

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 5e6775afa..072404944 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -484,6 +484,8 @@ use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
 use Digest::SHA qw(sha256_hex);
+use Text::Wrap;
+$Text::Wrap::columns = 62;
 
 # Below, 5.026 should be aligned with the version of perl actually
 # bundled in Buildroot:
@@ -686,7 +688,7 @@ while (my ($distname, $dist) = each %dist) {
     my $brname = brname( $fsname );
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
-        my $abstract = $dist->{abstract};
+        my $abstract = wrap( q{}, qq{\t  }, $dist->{abstract} );
         my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
         open my $fh, q{>}, $cfgname;
-- 
2.17.1
