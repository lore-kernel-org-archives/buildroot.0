From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  2 Oct 2014 16:35:18 -0500
Subject: [Buildroot] RFC: [PATCH 1/1] check-updates.py: Adds CVE check
Message-ID: <1412285719-26591-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch assumes that http://patchwork.ozlabs.org/patch/337267/
has been applied.

It also requires the installation of an external tool called cve-search.
(http://adulau.github.io/cve-search/)

Since the querying of CVE notices is fairly intensive, an approach
was chosen to use an offline database called cve-search which queries
the NIST xml feeds at an interval you would define when setting up that
application outside of Buildroot.  The check-updates.py script then uses one
of the cve-search query tools to try an match package names and versions
to CVE notices.  The script only attempts to try to find CVE matches if the
"CVE_SEARCH_PATH" environment variable is set before the script executions.
This environment variable points to the cve-search "search.py" tool.

There are still additional permutations of how the search looks for package
versions/names (ones that have a hash for a version and ones that use
underscores in names, etc...) that need to be worked out and added to the
script.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/check-updates.py |   93 ++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/support/scripts/check-updates.py b/support/scripts/check-updates.py
index de16fdc..62c77ee 100755
--- a/support/scripts/check-updates.py
+++ b/support/scripts/check-updates.py
@@ -14,9 +14,10 @@ from os.path import exists, isfile, join
 import shutil
 from distutils.version import LooseVersion
 import logging
-from logging import info, debug, error 
+from logging import info, debug, error
 from subprocess import check_output
 import pickle
+import os
 
 template = """
 <html>
@@ -26,8 +27,8 @@ template = """
   </script><script type="text/javascript" src="jquery.tablesorter.min.js">
   </script>
   <script type="text/javascript">
-    $(document).ready(function() { 
-      $("table.tablesorter").tablesorter();}); 
+    $(document).ready(function() {
+      $("table.tablesorter").tablesorter();});
   </script>
   <style>
 h1 {
@@ -61,14 +62,15 @@ td.other {
  <h1>Buildroot packages updates</h1>
 <table id="header" class="tablesorter">
     <thead>
-	<th>Package</th>
+    <th>Package</th>
     <th>Patch count</th>
     <th>Infrastructure</th>
     <th>Licence</th>
     <th>Licence files</th>
-	<th>current version</th>
-	<th>last version</th>
-	<th>provider</th>
+    <th>current version</th>
+    <th>last version</th>
+    <th>current CVEs</th>
+    <th>provider</th>
     <th>status</th>
     </thead>
     <tbody>"""
@@ -77,7 +79,7 @@ td.other {
 # TODO : Lua packages updates
 # sf fix way to check updates
 # audiofile > use git instead
-# gd > bitbucket 
+# gd > bitbucket
 
 # mysql_client takes too long (why?ftp pb?)
 # snmppp doesn't list downloads in same page
@@ -123,7 +125,7 @@ def getUrlRedirection(url):
     resp = h.request(url, "GET")[0]
     contentLocation = resp['content-location']
     return contentLocation
-	
+
 class Package(object):
 
 	def __init__(self, package_name):
@@ -136,10 +138,18 @@ class Package(object):
 		if source != None and source != '':
 			self.package_name = source
 		self.last_version = None
-		self.provider = None	
+		self.cve = self.get_cve_analysis(package_name)
+		self.provider = None
 		info('site :' + self.url)
 		info('version :' + self.version)
 
+	def get_cve_analysis(self, package_name):
+		cve_search_tool = os.environ.get('CVE_SEARCH_PATH')
+		if cve_search_tool is not None:
+			print("%s -p %s:%s" % (cve_search_tool, self.package_name, self.version))
+			return subprocess.check_output(["%s" % cve_search_tool, "-p", "%s:%s" % (self.package_name,self.version)])
+		return "None"
+
 	def get_url_and_version(self, package_name):
 		site_url = ''
 		source = ''
@@ -176,7 +186,7 @@ class Package(object):
 	def retrieve(self):
 		debug('function cache')
 		debug(self.package_name)
-		
+
 		if USE_CACHE and isfile('site/' + self.package_name):
 			debug('cache found !')
 			f = open('site/' + self.package_name, 'r')
@@ -208,18 +218,18 @@ class Package(object):
 			return 'website error'
 		self.last_version = self.get_last_version_specific()
 		return self.last_version
-	
+
 	def get_last_version_specific(self):
 		error('should not be called')
 		return None
-		
+
 	def clean_version(self):
 		return last_version
-		
+
 	def count_patches(self):
 		package_dir = join('../../package', self.package_name)
 		return len([f for root, dirs, files in walk(package_dir) for f in files if f.endswith('.patch')])
-		
+
 
 class Package_www(Package):
 	""" Specific www website
@@ -228,7 +238,7 @@ class Package_www(Package):
 	def __init__(self, package_name):
 		super(Package_www, self).__init__(package_name)
 		self.provider = 'www'
-		
+
 		debug('www website')
 
 	def retrieve_specific(self):
@@ -253,7 +263,7 @@ class Package_www(Package):
 			error('can\'t determine site version')
 			return None
 
-		try:    
+		try:
 			last_version = helper_get_last_version(versions)
 			debug(last_version)
 		except:
@@ -323,7 +333,7 @@ class Package_svn(Package):
 	def retrieve_specific(self):
 		debug('retrieve svn')
 		return check_output(["svn log --xml %s | grep \"revision\" | head -1" % self.url], shell=True)
-		
+
 	def get_last_version_specific(self):
 		debug('get_last_version_specific svn')
 		try:
@@ -362,7 +372,7 @@ class Package_launchpad(Package_www):
 		except:
 			error('can\'t determine launchpad version')
 			return None
-	   
+
 		return last_version
 
 class Package_git(Package):
@@ -372,7 +382,7 @@ class Package_git(Package):
 	def __init__(self, package_name):
 		super(Package_git, self).__init__(package_name)
 		self.provider = 'git'
-		
+
 		# get real git url from cgit
 		if 'cgit' in self.url and not self.url.endswith('.git'):
 			url_tmp = self.url.replace('snapshot', '')
@@ -387,11 +397,11 @@ class Package_git(Package):
 				debug(res)
 				self.url = res[0]
 			debug(self.url)
-	
+
 
 	def retrieve_specific(self):
 		debug('retrieve git')
-			
+
 		if len(self.version) == 40:
 			if 'github.com' in self.url:
 				git_url = self.url.split('github.com/')[1]
@@ -400,10 +410,10 @@ class Package_git(Package):
 
 			if 'git://' in self.url:
 				git_url = self.url
-			
+
 			result = check_output(["git ls-remote --heads %s" % git_url], shell=True)
 			debug(result)
-		else:   
+		else:
 			# if version is a real version number
 			if ('github.com' in self.url):
 				git_url = self.url.split('github.com/')[1]
@@ -462,7 +472,7 @@ class Package_git(Package):
 				last_version = last_version[1:]
 
 		return last_version
-		 
+
 class Package_sourceforge(Package):
 	""" Sourceforge.net
 		The following url give you the url of the last version available
@@ -540,9 +550,9 @@ class Package_googlecode(Package_www):
 		except:
 			error('can\'t determine version from googlecode')
 			return None
-	   
+
 		return last_version
-		
+
 class Package_pecl_php(Package):
 	""" pecl.php.net
 		The following url give you the url of the last version available
@@ -558,7 +568,7 @@ class Package_pecl_php(Package):
 		response = urllib2.urlopen(self.url)
 		debug(response.info().getheader('Content-Disposition'))
 		return response.info().getheader('Content-Disposition')
-		
+
 	def get_last_version_specific(self):
 		debug('retrieve pecl_php')
 		debug(self.result)
@@ -573,7 +583,7 @@ class Package_pecl_php(Package):
 		except:
 			error('can\'t determine version from pecl.php.net')
 			return None
-	   
+
 		return last_version
 
 class Package_alioth_debian(Package):
@@ -587,6 +597,9 @@ class Package_alioth_debian(Package):
 def package_factory(package_name):
 	package = Package(package_name)
 
+	package.provider = 'exception list'
+	return package
+
 	if package_name in exception_list:
 		error('Package in exception list! TODO later')
 		package.provider = 'exception list'
@@ -622,9 +635,9 @@ def package_factory(package_name):
 			package = Package_www(package_name)
 
 	return package
-			
+
 def version_clean_output(string):
-	""" Clean version before writing : 
+	""" Clean version before writing :
 		  - replace None by 'None'
 		  - return the first 8 characters if it's a 40 characters hash
 	"""
@@ -732,7 +745,7 @@ if __name__ == '__main__':
 		fh = logging.FileHandler('res.log', 'w')
 		formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
 		fh.setFormatter(formatter)
-		logger.addHandler(fh) 
+		logger.addHandler(fh)
 		logger.setLevel(logging.INFO)
 
 		f = open('out.html', 'w')
@@ -764,7 +777,7 @@ if __name__ == '__main__':
 				status = 'NOK'
 				version_class = 'nok'
 				nb_package_toupdate += 1
-				
+
 			if package.patch_count == 0:
 				patch_count_class = 'ok'
 			elif package.patch_count < 5:
@@ -774,9 +787,9 @@ if __name__ == '__main__':
 
 			# write package name, patch count and infrastructure
 			f.write('<tr><td>%s</td><td class="%s">%s</td>' % (package_name, patch_count_class, package.patch_count))
-			
+
 			#write infra
-			
+
 			if (package_name != 'celt051'):
 				for line in open(join('../../package/', package_name, package_name + '.mk')):
 					if 'autotools-package' in line:
@@ -794,7 +807,7 @@ if __name__ == '__main__':
 
 			if infra == 'unknown':
 				nb_package_infra_other += 1
-	
+
 			f.write('<td>%s</td>'% infra)
 
 			if have_licence:
@@ -808,19 +821,21 @@ if __name__ == '__main__':
 				f.write('<td class="nok">%s</td>' % have_licence_files)
 
 			f.write('<td class="%s">%s</td><td class="%s">%s</td>' % (version_class, version_clean_output(package.version), version_class, version_clean_output(package.last_version)))
+			f.write('<td>%s</td>' % (package.cve))
 
 			#for debug only, will be removed later
 			f.write('<td>%s</td><td>%s</td></tr>' % (package.provider, status))
 
+
 		f.write('</tbody></table>')
 		f.write('Stats: %d packages (%d up to date, %d old and %d unknown)<br/>' % (nb_package, nb_package_uptodate, nb_package_toupdate, nb_package_unknown))
-		
+
 		f.write('packages using <i>autotools</i> infrastructure : %d<br/>' % nb_package_infra_autotools)
 		f.write('packages using <i>generic</i> infrastructure : %d<br/>' % nb_package_infra_generic)
 		f.write('packages using <i>cmake</i> infrastructure : %d<br/>' % nb_package_infra_cmake)
 		f.write('packages using <i>other</i> infrastructure : %d<br/>' % nb_package_infra_other)
-		
+
 		f.write('</body></html>')
-		
+
 		info('Stats: %d packages (%d up to date, %d old and %d unknown)<br/>' % (nb_package, nb_package_uptodate, nb_package_toupdate, nb_package_unknown))
 	print 'done!'
-- 
1.7.9.5
