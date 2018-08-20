From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:16:21 -0700
Subject: [Buildroot] [PATCH 1/3] scancpan: wrap abstract if too long
In-Reply-To: <20180820111623.23173-1-chrismcc@gmail.com>
References: <20180820111623.23173-1-chrismcc@gmail.com>
Message-ID: <20180820111623.23173-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 utils/scancpan | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 8f47521692..6c90588ed4 100755
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
@@ -663,7 +665,7 @@ while (my ($distname, $dist) = each %dist) {
     my $brname = brname( $fsname );
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
-        my $abstract = $dist->{abstract};
+        my $abstract = wrap("","\t  ",$dist->{abstract});
         my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
         open my $fh, q{>}, $cfgname;
-- 
2.14.4
