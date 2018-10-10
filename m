From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:05:41 +0200
Subject: [Buildroot] [git commit] scancpan: wrap abstract if too long
Message-ID: <20181010070555.A96DA81E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=228b6b680a377d761c4e4773d24b313e16bcd9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[note: code style fixed]

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 5e6775afae..0724049441 100755
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
